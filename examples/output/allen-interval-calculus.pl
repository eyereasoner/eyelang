start(a, 10).
why(
  start(a, 10),
  proof(
    goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(b, 13).
why(
  start(b, 13),
  proof(
    goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(c, 12).
why(
  start(c, 12),
  proof(
    goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(d, 11).
why(
  start(d, 11),
  proof(
    goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(e, 10).
why(
  start(e, 10),
  proof(
    goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(f, 10).
why(
  start(f, 10),
  proof(
    goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(g, 11).
why(
  start(g, 11),
  proof(
    goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(h, 9).
why(
  start(h, 9),
  proof(
    goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(i, 16).
why(
  start(i, 16),
  proof(
    goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(j, 15).
why(
  start(j, 15),
  proof(
    goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

start(k, 13).
why(
  start(k, 13),
  proof(
    goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
    bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(a, 12).
why(
  end(a, 12),
  proof(
    goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(b, 15).
why(
  end(b, 15),
  proof(
    goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(c, 14).
why(
  end(c, 14),
  proof(
    goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(d, 13).
why(
  end(d, 13),
  proof(
    goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(e, 12).
why(
  end(e, 12),
  proof(
    goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(f, 11).
why(
  end(f, 11),
  proof(
    goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(g, 12).
why(
  end(g, 12),
  proof(
    goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(h, 16).
why(
  end(h, 16),
  proof(
    goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(i, 18).
why(
  end(i, 18),
  proof(
    goal(end(i, 18)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", i), binding("End", 18), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 16)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(j, 16).
why(
  end(j, 16),
  proof(
    goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

end(k, 14).
why(
  end(k, 14),
  proof(
    goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
    bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
    uses([
      proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
      proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
    ])
  )
).

duration(a, 2).
why(
  duration(a, 2),
  proof(
    goal(duration(a, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", a), binding("D", 2), binding("E", 12), binding("S", 10)]),
    uses([
      proof(
        goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(12, 10, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(b, 2).
why(
  duration(b, 2),
  proof(
    goal(duration(b, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", b), binding("D", 2), binding("E", 15), binding("S", 13)]),
    uses([
      proof(
        goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(15, 13, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(c, 2).
why(
  duration(c, 2),
  proof(
    goal(duration(c, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", c), binding("D", 2), binding("E", 14), binding("S", 12)]),
    uses([
      proof(
        goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(14, 12, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(d, 2).
why(
  duration(d, 2),
  proof(
    goal(duration(d, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", d), binding("D", 2), binding("E", 13), binding("S", 11)]),
    uses([
      proof(
        goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(13, 11, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(e, 2).
why(
  duration(e, 2),
  proof(
    goal(duration(e, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", e), binding("D", 2), binding("E", 12), binding("S", 10)]),
    uses([
      proof(
        goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(12, 10, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(f, 1).
why(
  duration(f, 1),
  proof(
    goal(duration(f, 1)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", f), binding("D", 1), binding("E", 11), binding("S", 10)]),
    uses([
      proof(
        goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(11, 10, 1)), by(builtin(sub, 3)))
    ])
  )
).

duration(g, 1).
why(
  duration(g, 1),
  proof(
    goal(duration(g, 1)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", g), binding("D", 1), binding("E", 12), binding("S", 11)]),
    uses([
      proof(
        goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(12, 11, 1)), by(builtin(sub, 3)))
    ])
  )
).

duration(h, 7).
why(
  duration(h, 7),
  proof(
    goal(duration(h, 7)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", h), binding("D", 7), binding("E", 16), binding("S", 9)]),
    uses([
      proof(
        goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(16, 9, 7)), by(builtin(sub, 3)))
    ])
  )
).

duration(i, 2).
why(
  duration(i, 2),
  proof(
    goal(duration(i, 2)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", i), binding("D", 2), binding("E", 18), binding("S", 16)]),
    uses([
      proof(
        goal(end(i, 18)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", i), binding("End", 18), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 16)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(18, 16, 2)), by(builtin(sub, 3)))
    ])
  )
).

duration(j, 1).
why(
  duration(j, 1),
  proof(
    goal(duration(j, 1)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", j), binding("D", 1), binding("E", 16), binding("S", 15)]),
    uses([
      proof(
        goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(16, 15, 1)), by(builtin(sub, 3)))
    ])
  )
).

duration(k, 1).
why(
  duration(k, 1),
  proof(
    goal(duration(k, 1)), by(rule("allen-interval-calculus.pl", clause(22))),
    bindings([binding("I", k), binding("D", 1), binding("E", 14), binding("S", 13)]),
    uses([
      proof(
        goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
        bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(
        goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
        bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
        uses([
          proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
          proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
        ])
      ),
      proof(goal(sub(14, 13, 1)), by(builtin(sub, 3)))
    ])
  )
).

statement(a, before, b).
why(
  statement(a, before, b),
  proof(
    goal(statement(a, before, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", before), binding("J", b)]),
    uses([
      proof(
        goal(relation(a, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", a), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, before, i).
why(
  statement(a, before, i),
  proof(
    goal(statement(a, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(a, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", a), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, before, j).
why(
  statement(a, before, j),
  proof(
    goal(statement(a, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(a, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", a), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, before, k).
why(
  statement(a, before, k),
  proof(
    goal(statement(a, before, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", before), binding("J", k)]),
    uses([
      proof(
        goal(relation(a, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", a), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(b, before, i).
why(
  statement(b, before, i),
  proof(
    goal(statement(b, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(b, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", b), binding("J", i), binding("EI", 15), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(15, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(c, before, i).
why(
  statement(c, before, i),
  proof(
    goal(statement(c, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(c, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", c), binding("J", i), binding("EI", 14), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(14, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(c, before, j).
why(
  statement(c, before, j),
  proof(
    goal(statement(c, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(c, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", c), binding("J", j), binding("EI", 14), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(14, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(d, before, i).
why(
  statement(d, before, i),
  proof(
    goal(statement(d, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(d, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", d), binding("J", i), binding("EI", 13), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(13, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(d, before, j).
why(
  statement(d, before, j),
  proof(
    goal(statement(d, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(d, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", d), binding("J", j), binding("EI", 13), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(13, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, before, b).
why(
  statement(e, before, b),
  proof(
    goal(statement(e, before, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", before), binding("J", b)]),
    uses([
      proof(
        goal(relation(e, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", e), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, before, i).
why(
  statement(e, before, i),
  proof(
    goal(statement(e, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(e, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", e), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, before, j).
why(
  statement(e, before, j),
  proof(
    goal(statement(e, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(e, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", e), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, before, k).
why(
  statement(e, before, k),
  proof(
    goal(statement(e, before, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", before), binding("J", k)]),
    uses([
      proof(
        goal(relation(e, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", e), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, before, b).
why(
  statement(f, before, b),
  proof(
    goal(statement(f, before, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", before), binding("J", b)]),
    uses([
      proof(
        goal(relation(f, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", f), binding("J", b), binding("EI", 11), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, before, c).
why(
  statement(f, before, c),
  proof(
    goal(statement(f, before, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", before), binding("J", c)]),
    uses([
      proof(
        goal(relation(f, before, c)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", f), binding("J", c), binding("EI", 11), binding("SJ", 12)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 12)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, before, i).
why(
  statement(f, before, i),
  proof(
    goal(statement(f, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(f, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", f), binding("J", i), binding("EI", 11), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, before, j).
why(
  statement(f, before, j),
  proof(
    goal(statement(f, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(f, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", f), binding("J", j), binding("EI", 11), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, before, k).
why(
  statement(f, before, k),
  proof(
    goal(statement(f, before, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", before), binding("J", k)]),
    uses([
      proof(
        goal(relation(f, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", f), binding("J", k), binding("EI", 11), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, before, b).
why(
  statement(g, before, b),
  proof(
    goal(statement(g, before, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", before), binding("J", b)]),
    uses([
      proof(
        goal(relation(g, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", g), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, before, i).
why(
  statement(g, before, i),
  proof(
    goal(statement(g, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(g, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", g), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, before, j).
why(
  statement(g, before, j),
  proof(
    goal(statement(g, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(g, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", g), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, before, k).
why(
  statement(g, before, k),
  proof(
    goal(statement(g, before, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", before), binding("J", k)]),
    uses([
      proof(
        goal(relation(g, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", g), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(k, before, i).
why(
  statement(k, before, i),
  proof(
    goal(statement(k, before, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", before), binding("J", i)]),
    uses([
      proof(
        goal(relation(k, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", k), binding("J", i), binding("EI", 14), binding("SJ", 16)]),
        uses([
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(14, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(k, before, j).
why(
  statement(k, before, j),
  proof(
    goal(statement(k, before, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", before), binding("J", j)]),
    uses([
      proof(
        goal(relation(k, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
        bindings([binding("I", k), binding("J", j), binding("EI", 14), binding("SJ", 15)]),
        uses([
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(14, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, meets, c).
why(
  statement(a, meets, c),
  proof(
    goal(statement(a, meets, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", meets), binding("J", c)]),
    uses([
      proof(
        goal(relation(a, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", a), binding("J", c), binding("E", 12)]),
        uses([
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, meets, j).
why(
  statement(b, meets, j),
  proof(
    goal(statement(b, meets, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", meets), binding("J", j)]),
    uses([
      proof(
        goal(relation(b, meets, j)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", b), binding("J", j), binding("E", 15)]),
        uses([
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(d, meets, b).
why(
  statement(d, meets, b),
  proof(
    goal(statement(d, meets, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", meets), binding("J", b)]),
    uses([
      proof(
        goal(relation(d, meets, b)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", d), binding("J", b), binding("E", 13)]),
        uses([
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(d, meets, k).
why(
  statement(d, meets, k),
  proof(
    goal(statement(d, meets, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", meets), binding("J", k)]),
    uses([
      proof(
        goal(relation(d, meets, k)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", d), binding("J", k), binding("E", 13)]),
        uses([
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(e, meets, c).
why(
  statement(e, meets, c),
  proof(
    goal(statement(e, meets, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", meets), binding("J", c)]),
    uses([
      proof(
        goal(relation(e, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", e), binding("J", c), binding("E", 12)]),
        uses([
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(f, meets, d).
why(
  statement(f, meets, d),
  proof(
    goal(statement(f, meets, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", meets), binding("J", d)]),
    uses([
      proof(
        goal(relation(f, meets, d)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", f), binding("J", d), binding("E", 11)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(f, meets, g).
why(
  statement(f, meets, g),
  proof(
    goal(statement(f, meets, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", meets), binding("J", g)]),
    uses([
      proof(
        goal(relation(f, meets, g)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", f), binding("J", g), binding("E", 11)]),
        uses([
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(g, meets, c).
why(
  statement(g, meets, c),
  proof(
    goal(statement(g, meets, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", meets), binding("J", c)]),
    uses([
      proof(
        goal(relation(g, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", g), binding("J", c), binding("E", 12)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, meets, i).
why(
  statement(h, meets, i),
  proof(
    goal(statement(h, meets, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", meets), binding("J", i)]),
    uses([
      proof(
        goal(relation(h, meets, i)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", h), binding("J", i), binding("E", 16)]),
        uses([
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, meets, i).
why(
  statement(j, meets, i),
  proof(
    goal(statement(j, meets, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", meets), binding("J", i)]),
    uses([
      proof(
        goal(relation(j, meets, i)), by(rule("allen-interval-calculus.pl", clause(10))),
        bindings([binding("I", j), binding("J", i), binding("E", 16)]),
        uses([
          proof(
            goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(a, overlaps, d).
why(
  statement(a, overlaps, d),
  proof(
    goal(statement(a, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", overlaps), binding("J", d)]),
    uses([
      proof(
        goal(relation(a, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(11))),
        bindings([binding("I", a), binding("J", d), binding("SI", 10), binding("EI", 12), binding("SJ", 11), binding("EJ", 13)]),
        uses([
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(10, 11)), by(builtin(lt, 2))),
          proof(goal(lt(11, 12)), by(builtin(lt, 2))),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(c, overlaps, b).
why(
  statement(c, overlaps, b),
  proof(
    goal(statement(c, overlaps, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", overlaps), binding("J", b)]),
    uses([
      proof(
        goal(relation(c, overlaps, b)), by(rule("allen-interval-calculus.pl", clause(11))),
        bindings([binding("I", c), binding("J", b), binding("SI", 12), binding("EI", 14), binding("SJ", 13), binding("EJ", 15)]),
        uses([
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2))),
          proof(goal(lt(13, 14)), by(builtin(lt, 2))),
          proof(goal(lt(14, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(d, overlaps, c).
why(
  statement(d, overlaps, c),
  proof(
    goal(statement(d, overlaps, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", overlaps), binding("J", c)]),
    uses([
      proof(
        goal(relation(d, overlaps, c)), by(rule("allen-interval-calculus.pl", clause(11))),
        bindings([binding("I", d), binding("J", c), binding("SI", 11), binding("EI", 13), binding("SJ", 12), binding("EJ", 14)]),
        uses([
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 12)), by(builtin(lt, 2))),
          proof(goal(lt(12, 13)), by(builtin(lt, 2))),
          proof(goal(lt(13, 14)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, overlaps, d).
why(
  statement(e, overlaps, d),
  proof(
    goal(statement(e, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", overlaps), binding("J", d)]),
    uses([
      proof(
        goal(relation(e, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(11))),
        bindings([binding("I", e), binding("J", d), binding("SI", 10), binding("EI", 12), binding("SJ", 11), binding("EJ", 13)]),
        uses([
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(10, 11)), by(builtin(lt, 2))),
          proof(goal(lt(11, 12)), by(builtin(lt, 2))),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, starts, a).
why(
  statement(f, starts, a),
  proof(
    goal(statement(f, starts, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", starts), binding("J", a)]),
    uses([
      proof(
        goal(relation(f, starts, a)), by(rule("allen-interval-calculus.pl", clause(12))),
        bindings([binding("I", f), binding("J", a), binding("S", 10), binding("EI", 11), binding("EJ", 12)]),
        uses([
          proof(
            goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 12)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, starts, e).
why(
  statement(f, starts, e),
  proof(
    goal(statement(f, starts, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", starts), binding("J", e)]),
    uses([
      proof(
        goal(relation(f, starts, e)), by(rule("allen-interval-calculus.pl", clause(12))),
        bindings([binding("I", f), binding("J", e), binding("S", 10), binding("EI", 11), binding("EJ", 12)]),
        uses([
          proof(
            goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(11, 12)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, starts, d).
why(
  statement(g, starts, d),
  proof(
    goal(statement(g, starts, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", starts), binding("J", d)]),
    uses([
      proof(
        goal(relation(g, starts, d)), by(rule("allen-interval-calculus.pl", clause(12))),
        bindings([binding("I", g), binding("J", d), binding("S", 11), binding("EI", 12), binding("EJ", 13)]),
        uses([
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(k, starts, b).
why(
  statement(k, starts, b),
  proof(
    goal(statement(k, starts, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", starts), binding("J", b)]),
    uses([
      proof(
        goal(relation(k, starts, b)), by(rule("allen-interval-calculus.pl", clause(12))),
        bindings([binding("I", k), binding("J", b), binding("S", 13), binding("EI", 14), binding("EJ", 15)]),
        uses([
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(14, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, during, h).
why(
  statement(a, during, h),
  proof(
    goal(statement(a, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(a, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", a), binding("J", h), binding("SI", 10), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 10)), by(builtin(lt, 2))),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(b, during, h).
why(
  statement(b, during, h),
  proof(
    goal(statement(b, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(b, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", b), binding("J", h), binding("SI", 13), binding("EI", 15), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 13)), by(builtin(lt, 2))),
          proof(goal(lt(15, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(c, during, h).
why(
  statement(c, during, h),
  proof(
    goal(statement(c, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(c, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", c), binding("J", h), binding("SI", 12), binding("EI", 14), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 12)), by(builtin(lt, 2))),
          proof(goal(lt(14, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(d, during, h).
why(
  statement(d, during, h),
  proof(
    goal(statement(d, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(d, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", d), binding("J", h), binding("SI", 11), binding("EI", 13), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 11)), by(builtin(lt, 2))),
          proof(goal(lt(13, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(e, during, h).
why(
  statement(e, during, h),
  proof(
    goal(statement(e, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(e, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", e), binding("J", h), binding("SI", 10), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 10)), by(builtin(lt, 2))),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(f, during, h).
why(
  statement(f, during, h),
  proof(
    goal(statement(f, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(f, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", f), binding("J", h), binding("SI", 10), binding("EI", 11), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 10)), by(builtin(lt, 2))),
          proof(goal(lt(11, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, during, h).
why(
  statement(g, during, h),
  proof(
    goal(statement(g, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(g, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", g), binding("J", h), binding("SI", 11), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 11)), by(builtin(lt, 2))),
          proof(goal(lt(12, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(k, during, h).
why(
  statement(k, during, h),
  proof(
    goal(statement(k, during, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", during), binding("J", h)]),
    uses([
      proof(
        goal(relation(k, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
        bindings([binding("I", k), binding("J", h), binding("SI", 13), binding("EI", 14), binding("SJ", 9), binding("EJ", 16)]),
        uses([
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 13)), by(builtin(lt, 2))),
          proof(goal(lt(14, 16)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, finishes, a).
why(
  statement(g, finishes, a),
  proof(
    goal(statement(g, finishes, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", finishes), binding("J", a)]),
    uses([
      proof(
        goal(relation(g, finishes, a)), by(rule("allen-interval-calculus.pl", clause(14))),
        bindings([binding("I", g), binding("J", a), binding("E", 12), binding("SI", 11), binding("SJ", 10)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(10, 11)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(g, finishes, e).
why(
  statement(g, finishes, e),
  proof(
    goal(statement(g, finishes, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", finishes), binding("J", e)]),
    uses([
      proof(
        goal(relation(g, finishes, e)), by(rule("allen-interval-calculus.pl", clause(14))),
        bindings([binding("I", g), binding("J", e), binding("E", 12), binding("SI", 11), binding("SJ", 10)]),
        uses([
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(10, 11)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(j, finishes, h).
why(
  statement(j, finishes, h),
  proof(
    goal(statement(j, finishes, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", finishes), binding("J", h)]),
    uses([
      proof(
        goal(relation(j, finishes, h)), by(rule("allen-interval-calculus.pl", clause(14))),
        bindings([binding("I", j), binding("J", h), binding("E", 16), binding("SI", 15), binding("SJ", 9)]),
        uses([
          proof(
            goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(9, 15)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(k, finishes, c).
why(
  statement(k, finishes, c),
  proof(
    goal(statement(k, finishes, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", finishes), binding("J", c)]),
    uses([
      proof(
        goal(relation(k, finishes, c)), by(rule("allen-interval-calculus.pl", clause(14))),
        bindings([binding("I", k), binding("J", c), binding("E", 14), binding("SI", 13), binding("SJ", 12)]),
        uses([
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(lt(12, 13)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(a, equals, a).
why(
  statement(a, equals, a),
  proof(
    goal(statement(a, equals, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", equals), binding("J", a)]),
    uses([
      proof(
        goal(relation(a, equals, a)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", a), binding("J", a), binding("S", 10), binding("E", 12)]),
        uses([
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(a, equals, e).
why(
  statement(a, equals, e),
  proof(
    goal(statement(a, equals, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", equals), binding("J", e)]),
    uses([
      proof(
        goal(relation(a, equals, e)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", a), binding("J", e), binding("S", 10), binding("E", 12)]),
        uses([
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, equals, b).
why(
  statement(b, equals, b),
  proof(
    goal(statement(b, equals, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", equals), binding("J", b)]),
    uses([
      proof(
        goal(relation(b, equals, b)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", b), binding("J", b), binding("S", 13), binding("E", 15)]),
        uses([
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(c, equals, c).
why(
  statement(c, equals, c),
  proof(
    goal(statement(c, equals, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", equals), binding("J", c)]),
    uses([
      proof(
        goal(relation(c, equals, c)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", c), binding("J", c), binding("S", 12), binding("E", 14)]),
        uses([
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(d, equals, d).
why(
  statement(d, equals, d),
  proof(
    goal(statement(d, equals, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", equals), binding("J", d)]),
    uses([
      proof(
        goal(relation(d, equals, d)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", d), binding("J", d), binding("S", 11), binding("E", 13)]),
        uses([
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(e, equals, a).
why(
  statement(e, equals, a),
  proof(
    goal(statement(e, equals, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", equals), binding("J", a)]),
    uses([
      proof(
        goal(relation(e, equals, a)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", e), binding("J", a), binding("S", 10), binding("E", 12)]),
        uses([
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(e, equals, e).
why(
  statement(e, equals, e),
  proof(
    goal(statement(e, equals, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", equals), binding("J", e)]),
    uses([
      proof(
        goal(relation(e, equals, e)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", e), binding("J", e), binding("S", 10), binding("E", 12)]),
        uses([
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(f, equals, f).
why(
  statement(f, equals, f),
  proof(
    goal(statement(f, equals, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", f), binding("Rel", equals), binding("J", f)]),
    uses([
      proof(
        goal(relation(f, equals, f)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", f), binding("J", f), binding("S", 10), binding("E", 11)]),
        uses([
          proof(
            goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(g, equals, g).
why(
  statement(g, equals, g),
  proof(
    goal(statement(g, equals, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", equals), binding("J", g)]),
    uses([
      proof(
        goal(relation(g, equals, g)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", g), binding("J", g), binding("S", 11), binding("E", 12)]),
        uses([
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, equals, h).
why(
  statement(h, equals, h),
  proof(
    goal(statement(h, equals, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", equals), binding("J", h)]),
    uses([
      proof(
        goal(relation(h, equals, h)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", h), binding("J", h), binding("S", 9), binding("E", 16)]),
        uses([
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, equals, i).
why(
  statement(i, equals, i),
  proof(
    goal(statement(i, equals, i)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", equals), binding("J", i)]),
    uses([
      proof(
        goal(relation(i, equals, i)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", i), binding("J", i), binding("S", 16), binding("E", 18)]),
        uses([
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(i, 18)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", i), binding("End", 18), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(i, 18)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", i), binding("End", 18), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, equals, j).
why(
  statement(j, equals, j),
  proof(
    goal(statement(j, equals, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", equals), binding("J", j)]),
    uses([
      proof(
        goal(relation(j, equals, j)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", j), binding("J", j), binding("S", 15), binding("E", 16)]),
        uses([
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(k, equals, k).
why(
  statement(k, equals, k),
  proof(
    goal(statement(k, equals, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", equals), binding("J", k)]),
    uses([
      proof(
        goal(relation(k, equals, k)), by(rule("allen-interval-calculus.pl", clause(15))),
        bindings([binding("I", k), binding("J", k), binding("S", 13), binding("E", 14)]),
        uses([
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
            bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
            bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
            uses([
              proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
              proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, after, a).
why(
  statement(b, after, a),
  proof(
    goal(statement(b, after, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", after), binding("J", a)]),
    uses([
      proof(
        goal(relation(b, after, a)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", b), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", a), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, a).
why(
  statement(i, after, a),
  proof(
    goal(statement(i, after, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", a)]),
    uses([
      proof(
        goal(relation(i, after, a)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", a), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, a).
why(
  statement(j, after, a),
  proof(
    goal(statement(j, after, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", a)]),
    uses([
      proof(
        goal(relation(j, after, a)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", a), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(k, after, a).
why(
  statement(k, after, a),
  proof(
    goal(statement(k, after, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", after), binding("J", a)]),
    uses([
      proof(
        goal(relation(k, after, a)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", k), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", a), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, b).
why(
  statement(i, after, b),
  proof(
    goal(statement(i, after, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", b)]),
    uses([
      proof(
        goal(relation(i, after, b)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", b)]),
        uses([
          proof(
            goal(relation(b, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", b), binding("J", i), binding("EI", 15), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(15, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, c).
why(
  statement(i, after, c),
  proof(
    goal(statement(i, after, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", c)]),
    uses([
      proof(
        goal(relation(i, after, c)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", c)]),
        uses([
          proof(
            goal(relation(c, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", c), binding("J", i), binding("EI", 14), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(14, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, c).
why(
  statement(j, after, c),
  proof(
    goal(statement(j, after, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", c)]),
    uses([
      proof(
        goal(relation(j, after, c)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", c)]),
        uses([
          proof(
            goal(relation(c, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", c), binding("J", j), binding("EI", 14), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(14, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, d).
why(
  statement(i, after, d),
  proof(
    goal(statement(i, after, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", d)]),
    uses([
      proof(
        goal(relation(i, after, d)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", d), binding("J", i), binding("EI", 13), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(13, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, d).
why(
  statement(j, after, d),
  proof(
    goal(statement(j, after, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", d)]),
    uses([
      proof(
        goal(relation(j, after, d)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", d), binding("J", j), binding("EI", 13), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(13, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, after, e).
why(
  statement(b, after, e),
  proof(
    goal(statement(b, after, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", after), binding("J", e)]),
    uses([
      proof(
        goal(relation(b, after, e)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", b), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", e), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, e).
why(
  statement(i, after, e),
  proof(
    goal(statement(i, after, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", e)]),
    uses([
      proof(
        goal(relation(i, after, e)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", e), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, e).
why(
  statement(j, after, e),
  proof(
    goal(statement(j, after, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", e)]),
    uses([
      proof(
        goal(relation(j, after, e)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", e), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(k, after, e).
why(
  statement(k, after, e),
  proof(
    goal(statement(k, after, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", after), binding("J", e)]),
    uses([
      proof(
        goal(relation(k, after, e)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", k), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", e), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, after, f).
why(
  statement(b, after, f),
  proof(
    goal(statement(b, after, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", after), binding("J", f)]),
    uses([
      proof(
        goal(relation(b, after, f)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", b), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", f), binding("J", b), binding("EI", 11), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(c, after, f).
why(
  statement(c, after, f),
  proof(
    goal(statement(c, after, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", after), binding("J", f)]),
    uses([
      proof(
        goal(relation(c, after, f)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", c), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, before, c)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", f), binding("J", c), binding("EI", 11), binding("SJ", 12)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 12)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, f).
why(
  statement(i, after, f),
  proof(
    goal(statement(i, after, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", f)]),
    uses([
      proof(
        goal(relation(i, after, f)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", f), binding("J", i), binding("EI", 11), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, f).
why(
  statement(j, after, f),
  proof(
    goal(statement(j, after, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", f)]),
    uses([
      proof(
        goal(relation(j, after, f)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", f), binding("J", j), binding("EI", 11), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(k, after, f).
why(
  statement(k, after, f),
  proof(
    goal(statement(k, after, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", after), binding("J", f)]),
    uses([
      proof(
        goal(relation(k, after, f)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", k), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", f), binding("J", k), binding("EI", 11), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, after, g).
why(
  statement(b, after, g),
  proof(
    goal(statement(b, after, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", after), binding("J", g)]),
    uses([
      proof(
        goal(relation(b, after, g)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", b), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, before, b)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", g), binding("J", b), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, g).
why(
  statement(i, after, g),
  proof(
    goal(statement(i, after, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", g)]),
    uses([
      proof(
        goal(relation(i, after, g)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", g), binding("J", i), binding("EI", 12), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, g).
why(
  statement(j, after, g),
  proof(
    goal(statement(j, after, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", g)]),
    uses([
      proof(
        goal(relation(j, after, g)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", g), binding("J", j), binding("EI", 12), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(k, after, g).
why(
  statement(k, after, g),
  proof(
    goal(statement(k, after, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", after), binding("J", g)]),
    uses([
      proof(
        goal(relation(k, after, g)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", k), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, before, k)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", g), binding("J", k), binding("EI", 12), binding("SJ", 13)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(i, after, k).
why(
  statement(i, after, k),
  proof(
    goal(statement(i, after, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", after), binding("J", k)]),
    uses([
      proof(
        goal(relation(i, after, k)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", i), binding("I", k)]),
        uses([
          proof(
            goal(relation(k, before, i)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", k), binding("J", i), binding("EI", 14), binding("SJ", 16)]),
            uses([
              proof(
                goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(14, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(j, after, k).
why(
  statement(j, after, k),
  proof(
    goal(statement(j, after, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", after), binding("J", k)]),
    uses([
      proof(
        goal(relation(j, after, k)), by(rule("allen-interval-calculus.pl", clause(16))),
        bindings([binding("J", j), binding("I", k)]),
        uses([
          proof(
            goal(relation(k, before, j)), by(rule("allen-interval-calculus.pl", clause(9))),
            bindings([binding("I", k), binding("J", j), binding("EI", 14), binding("SJ", 15)]),
            uses([
              proof(
                goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(14, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(c, metBy, a).
why(
  statement(c, metBy, a),
  proof(
    goal(statement(c, metBy, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", metBy), binding("J", a)]),
    uses([
      proof(
        goal(relation(c, metBy, a)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", c), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", a), binding("J", c), binding("E", 12)]),
            uses([
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(j, metBy, b).
why(
  statement(j, metBy, b),
  proof(
    goal(statement(j, metBy, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", j), binding("Rel", metBy), binding("J", b)]),
    uses([
      proof(
        goal(relation(j, metBy, b)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", j), binding("I", b)]),
        uses([
          proof(
            goal(relation(b, meets, j)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", b), binding("J", j), binding("E", 15)]),
            uses([
              proof(
                goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(b, metBy, d).
why(
  statement(b, metBy, d),
  proof(
    goal(statement(b, metBy, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", metBy), binding("J", d)]),
    uses([
      proof(
        goal(relation(b, metBy, d)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", b), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, meets, b)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", d), binding("J", b), binding("E", 13)]),
            uses([
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(k, metBy, d).
why(
  statement(k, metBy, d),
  proof(
    goal(statement(k, metBy, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", k), binding("Rel", metBy), binding("J", d)]),
    uses([
      proof(
        goal(relation(k, metBy, d)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", k), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, meets, k)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", d), binding("J", k), binding("E", 13)]),
            uses([
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(c, metBy, e).
why(
  statement(c, metBy, e),
  proof(
    goal(statement(c, metBy, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", metBy), binding("J", e)]),
    uses([
      proof(
        goal(relation(c, metBy, e)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", c), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", e), binding("J", c), binding("E", 12)]),
            uses([
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(d, metBy, f).
why(
  statement(d, metBy, f),
  proof(
    goal(statement(d, metBy, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", metBy), binding("J", f)]),
    uses([
      proof(
        goal(relation(d, metBy, f)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", d), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, meets, d)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", f), binding("J", d), binding("E", 11)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(g, metBy, f).
why(
  statement(g, metBy, f),
  proof(
    goal(statement(g, metBy, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", g), binding("Rel", metBy), binding("J", f)]),
    uses([
      proof(
        goal(relation(g, metBy, f)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", g), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, meets, g)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", f), binding("J", g), binding("E", 11)]),
            uses([
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(c, metBy, g).
why(
  statement(c, metBy, g),
  proof(
    goal(statement(c, metBy, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", metBy), binding("J", g)]),
    uses([
      proof(
        goal(relation(c, metBy, g)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", c), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, meets, c)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", g), binding("J", c), binding("E", 12)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(i, metBy, h).
why(
  statement(i, metBy, h),
  proof(
    goal(statement(i, metBy, h)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", metBy), binding("J", h)]),
    uses([
      proof(
        goal(relation(i, metBy, h)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", i), binding("I", h)]),
        uses([
          proof(
            goal(relation(h, meets, i)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", h), binding("J", i), binding("E", 16)]),
            uses([
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(i, metBy, j).
why(
  statement(i, metBy, j),
  proof(
    goal(statement(i, metBy, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", i), binding("Rel", metBy), binding("J", j)]),
    uses([
      proof(
        goal(relation(i, metBy, j)), by(rule("allen-interval-calculus.pl", clause(17))),
        bindings([binding("J", i), binding("I", j)]),
        uses([
          proof(
            goal(relation(j, meets, i)), by(rule("allen-interval-calculus.pl", clause(10))),
            bindings([binding("I", j), binding("J", i), binding("E", 16)]),
            uses([
              proof(
                goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(i, 16)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", i), binding("Start", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 18)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(i, 16, 18), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(d, overlappedBy, a).
why(
  statement(d, overlappedBy, a),
  proof(
    goal(statement(d, overlappedBy, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", overlappedBy), binding("J", a)]),
    uses([
      proof(
        goal(relation(d, overlappedBy, a)), by(rule("allen-interval-calculus.pl", clause(18))),
        bindings([binding("J", d), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(11))),
            bindings([binding("I", a), binding("J", d), binding("SI", 10), binding("EI", 12), binding("SJ", 11), binding("EJ", 13)]),
            uses([
              proof(
                goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(10, 11)), by(builtin(lt, 2))),
              proof(goal(lt(11, 12)), by(builtin(lt, 2))),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, overlappedBy, c).
why(
  statement(b, overlappedBy, c),
  proof(
    goal(statement(b, overlappedBy, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", overlappedBy), binding("J", c)]),
    uses([
      proof(
        goal(relation(b, overlappedBy, c)), by(rule("allen-interval-calculus.pl", clause(18))),
        bindings([binding("J", b), binding("I", c)]),
        uses([
          proof(
            goal(relation(c, overlaps, b)), by(rule("allen-interval-calculus.pl", clause(11))),
            bindings([binding("I", c), binding("J", b), binding("SI", 12), binding("EI", 14), binding("SJ", 13), binding("EJ", 15)]),
            uses([
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2))),
              proof(goal(lt(13, 14)), by(builtin(lt, 2))),
              proof(goal(lt(14, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(c, overlappedBy, d).
why(
  statement(c, overlappedBy, d),
  proof(
    goal(statement(c, overlappedBy, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", overlappedBy), binding("J", d)]),
    uses([
      proof(
        goal(relation(c, overlappedBy, d)), by(rule("allen-interval-calculus.pl", clause(18))),
        bindings([binding("J", c), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, overlaps, c)), by(rule("allen-interval-calculus.pl", clause(11))),
            bindings([binding("I", d), binding("J", c), binding("SI", 11), binding("EI", 13), binding("SJ", 12), binding("EJ", 14)]),
            uses([
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 12)), by(builtin(lt, 2))),
              proof(goal(lt(12, 13)), by(builtin(lt, 2))),
              proof(goal(lt(13, 14)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(d, overlappedBy, e).
why(
  statement(d, overlappedBy, e),
  proof(
    goal(statement(d, overlappedBy, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", overlappedBy), binding("J", e)]),
    uses([
      proof(
        goal(relation(d, overlappedBy, e)), by(rule("allen-interval-calculus.pl", clause(18))),
        bindings([binding("J", d), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, overlaps, d)), by(rule("allen-interval-calculus.pl", clause(11))),
            bindings([binding("I", e), binding("J", d), binding("SI", 10), binding("EI", 12), binding("SJ", 11), binding("EJ", 13)]),
            uses([
              proof(
                goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(10, 11)), by(builtin(lt, 2))),
              proof(goal(lt(11, 12)), by(builtin(lt, 2))),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(a, startedBy, f).
why(
  statement(a, startedBy, f),
  proof(
    goal(statement(a, startedBy, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", startedBy), binding("J", f)]),
    uses([
      proof(
        goal(relation(a, startedBy, f)), by(rule("allen-interval-calculus.pl", clause(19))),
        bindings([binding("J", a), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, starts, a)), by(rule("allen-interval-calculus.pl", clause(12))),
            bindings([binding("I", f), binding("J", a), binding("S", 10), binding("EI", 11), binding("EJ", 12)]),
            uses([
              proof(
                goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 12)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(e, startedBy, f).
why(
  statement(e, startedBy, f),
  proof(
    goal(statement(e, startedBy, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", startedBy), binding("J", f)]),
    uses([
      proof(
        goal(relation(e, startedBy, f)), by(rule("allen-interval-calculus.pl", clause(19))),
        bindings([binding("J", e), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, starts, e)), by(rule("allen-interval-calculus.pl", clause(12))),
            bindings([binding("I", f), binding("J", e), binding("S", 10), binding("EI", 11), binding("EJ", 12)]),
            uses([
              proof(
                goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(11, 12)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(d, startedBy, g).
why(
  statement(d, startedBy, g),
  proof(
    goal(statement(d, startedBy, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", d), binding("Rel", startedBy), binding("J", g)]),
    uses([
      proof(
        goal(relation(d, startedBy, g)), by(rule("allen-interval-calculus.pl", clause(19))),
        bindings([binding("J", d), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, starts, d)), by(rule("allen-interval-calculus.pl", clause(12))),
            bindings([binding("I", g), binding("J", d), binding("S", 11), binding("EI", 12), binding("EJ", 13)]),
            uses([
              proof(
                goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(b, startedBy, k).
why(
  statement(b, startedBy, k),
  proof(
    goal(statement(b, startedBy, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", b), binding("Rel", startedBy), binding("J", k)]),
    uses([
      proof(
        goal(relation(b, startedBy, k)), by(rule("allen-interval-calculus.pl", clause(19))),
        bindings([binding("J", b), binding("I", k)]),
        uses([
          proof(
            goal(relation(k, starts, b)), by(rule("allen-interval-calculus.pl", clause(12))),
            bindings([binding("I", k), binding("J", b), binding("S", 13), binding("EI", 14), binding("EJ", 15)]),
            uses([
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(14, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, a).
why(
  statement(h, contains, a),
  proof(
    goal(statement(h, contains, a)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", a)]),
    uses([
      proof(
        goal(relation(h, contains, a)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", a)]),
        uses([
          proof(
            goal(relation(a, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", a), binding("J", h), binding("SI", 10), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 10)), by(builtin(lt, 2))),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, b).
why(
  statement(h, contains, b),
  proof(
    goal(statement(h, contains, b)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", b)]),
    uses([
      proof(
        goal(relation(h, contains, b)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", b)]),
        uses([
          proof(
            goal(relation(b, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", b), binding("J", h), binding("SI", 13), binding("EI", 15), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(b, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", b), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(b, 15)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", b), binding("End", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(b, 13, 15), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 13)), by(builtin(lt, 2))),
              proof(goal(lt(15, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, c).
why(
  statement(h, contains, c),
  proof(
    goal(statement(h, contains, c)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", c)]),
    uses([
      proof(
        goal(relation(h, contains, c)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", c)]),
        uses([
          proof(
            goal(relation(c, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", c), binding("J", h), binding("SI", 12), binding("EI", 14), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 12)), by(builtin(lt, 2))),
              proof(goal(lt(14, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, d).
why(
  statement(h, contains, d),
  proof(
    goal(statement(h, contains, d)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", d)]),
    uses([
      proof(
        goal(relation(h, contains, d)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", d)]),
        uses([
          proof(
            goal(relation(d, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", d), binding("J", h), binding("SI", 11), binding("EI", 13), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(d, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", d), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(d, 13)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", d), binding("End", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(d, 11, 13), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 11)), by(builtin(lt, 2))),
              proof(goal(lt(13, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, e).
why(
  statement(h, contains, e),
  proof(
    goal(statement(h, contains, e)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", e)]),
    uses([
      proof(
        goal(relation(h, contains, e)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", e)]),
        uses([
          proof(
            goal(relation(e, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", e), binding("J", h), binding("SI", 10), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 10)), by(builtin(lt, 2))),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, f).
why(
  statement(h, contains, f),
  proof(
    goal(statement(h, contains, f)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", f)]),
    uses([
      proof(
        goal(relation(h, contains, f)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", f)]),
        uses([
          proof(
            goal(relation(f, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", f), binding("J", h), binding("SI", 10), binding("EI", 11), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(f, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", f), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(f, 11)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", f), binding("End", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(f, 10, 11), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 10)), by(builtin(lt, 2))),
              proof(goal(lt(11, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, g).
why(
  statement(h, contains, g),
  proof(
    goal(statement(h, contains, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", g)]),
    uses([
      proof(
        goal(relation(h, contains, g)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", g), binding("J", h), binding("SI", 11), binding("EI", 12), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 11)), by(builtin(lt, 2))),
              proof(goal(lt(12, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, contains, k).
why(
  statement(h, contains, k),
  proof(
    goal(statement(h, contains, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", contains), binding("J", k)]),
    uses([
      proof(
        goal(relation(h, contains, k)), by(rule("allen-interval-calculus.pl", clause(20))),
        bindings([binding("J", h), binding("I", k)]),
        uses([
          proof(
            goal(relation(k, during, h)), by(rule("allen-interval-calculus.pl", clause(13))),
            bindings([binding("I", k), binding("J", h), binding("SI", 13), binding("EI", 14), binding("SJ", 9), binding("EJ", 16)]),
            uses([
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 13)), by(builtin(lt, 2))),
              proof(goal(lt(14, 16)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(a, finishedBy, g).
why(
  statement(a, finishedBy, g),
  proof(
    goal(statement(a, finishedBy, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", a), binding("Rel", finishedBy), binding("J", g)]),
    uses([
      proof(
        goal(relation(a, finishedBy, g)), by(rule("allen-interval-calculus.pl", clause(21))),
        bindings([binding("J", a), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, finishes, a)), by(rule("allen-interval-calculus.pl", clause(14))),
            bindings([binding("I", g), binding("J", a), binding("E", 12), binding("SI", 11), binding("SJ", 10)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(a, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", a), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(a, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", a), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(a, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(10, 11)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(e, finishedBy, g).
why(
  statement(e, finishedBy, g),
  proof(
    goal(statement(e, finishedBy, g)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", e), binding("Rel", finishedBy), binding("J", g)]),
    uses([
      proof(
        goal(relation(e, finishedBy, g)), by(rule("allen-interval-calculus.pl", clause(21))),
        bindings([binding("J", e), binding("I", g)]),
        uses([
          proof(
            goal(relation(g, finishes, e)), by(rule("allen-interval-calculus.pl", clause(14))),
            bindings([binding("I", g), binding("J", e), binding("E", 12), binding("SI", 11), binding("SJ", 10)]),
            uses([
              proof(
                goal(end(g, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", g), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 11)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(e, 12)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", e), binding("End", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 10)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(g, 11)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", g), binding("Start", 11), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(g, 11, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(e, 10)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", e), binding("Start", 10), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(e, 10, 12), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(10, 11)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(h, finishedBy, j).
why(
  statement(h, finishedBy, j),
  proof(
    goal(statement(h, finishedBy, j)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", h), binding("Rel", finishedBy), binding("J", j)]),
    uses([
      proof(
        goal(relation(h, finishedBy, j)), by(rule("allen-interval-calculus.pl", clause(21))),
        bindings([binding("J", h), binding("I", j)]),
        uses([
          proof(
            goal(relation(j, finishes, h)), by(rule("allen-interval-calculus.pl", clause(14))),
            bindings([binding("I", j), binding("J", h), binding("E", 16), binding("SI", 15), binding("SJ", 9)]),
            uses([
              proof(
                goal(end(j, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", j), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 15)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(h, 16)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", h), binding("End", 16), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 9)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(j, 15)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", j), binding("Start", 15), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(j, 15, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(h, 9)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", h), binding("Start", 9), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 16)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(h, 9, 16), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(9, 15)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

statement(c, finishedBy, k).
why(
  statement(c, finishedBy, k),
  proof(
    goal(statement(c, finishedBy, k)), by(rule("allen-interval-calculus.pl", clause(23))),
    bindings([binding("I", c), binding("Rel", finishedBy), binding("J", k)]),
    uses([
      proof(
        goal(relation(c, finishedBy, k)), by(rule("allen-interval-calculus.pl", clause(21))),
        bindings([binding("J", c), binding("I", k)]),
        uses([
          proof(
            goal(relation(k, finishes, c)), by(rule("allen-interval-calculus.pl", clause(14))),
            bindings([binding("I", k), binding("J", c), binding("E", 14), binding("SI", 13), binding("SJ", 12)]),
            uses([
              proof(
                goal(end(k, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", k), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 13)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(end(c, 14)), by(rule("allen-interval-calculus.pl", clause(8))),
                bindings([binding("I", c), binding("End", 14), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_Start", 12)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(k, 13)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", k), binding("Start", 13), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(k, 13, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(start(c, 12)), by(rule("allen-interval-calculus.pl", clause(7))),
                bindings([binding("I", c), binding("Start", 12), binding("Table", [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)]), binding("_End", 14)]),
                uses([
                  proof(goal(interval_table([interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(fact("allen-interval-calculus.pl", clause(5)))),
                  proof(goal(member(interval(c, 12, 14), [interval(a, 10, 12), interval(b, 13, 15), interval(c, 12, 14), interval(d, 11, 13), interval(e, 10, 12), interval(f, 10, 11), interval(g, 11, 12), interval(h, 9, 16), interval(i, 16, 18), interval(j, 15, 16), interval(k, 13, 14)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(lt(12, 13)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

