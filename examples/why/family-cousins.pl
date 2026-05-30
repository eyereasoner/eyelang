branch(dave, b).
why(
  branch(dave, b),
  proof(
    goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
    bindings([binding("Person", dave), binding("Branch", b)]),
    uses([
      proof(
        goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
        bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
        uses([
          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
        ])
      )
    ])
  )
).

branch(eve, b).
why(
  branch(eve, b),
  proof(
    goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
    bindings([binding("Person", eve), binding("Branch", b)]),
    uses([
      proof(
        goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
        bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
        uses([
          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
        ])
      )
    ])
  )
).

branch(frank, c).
why(
  branch(frank, c),
  proof(
    goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
    bindings([binding("Person", frank), binding("Branch", c)]),
    uses([
      proof(
        goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
        bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
        uses([
          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
        ])
      )
    ])
  )
).

branch(grace, c).
why(
  branch(grace, c),
  proof(
    goal(branch(grace, c)), by(rule("family-cousins.pl", clause(10))),
    bindings([binding("Person", grace), binding("Branch", c)]),
    uses([
      proof(
        goal(family_statement(grace, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
        bindings([binding("S", grace), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
        uses([
          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), grace, seedBranch, c)), by(builtin(formula_binary, 4)))
        ])
      )
    ])
  )
).

branch(heidi, b).
why(
  branch(heidi, b),
  proof(
    goal(branch(heidi, b)), by(rule("family-cousins.pl", clause(15))),
    bindings([binding("Child", heidi), binding("Branch", b), binding("Parent", dave)]),
    uses([
      proof(
        goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", dave), binding("Child", heidi)]),
        uses([
          proof(
            goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", dave), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

branch(ivan, b).
why(
  branch(ivan, b),
  proof(
    goal(branch(ivan, b)), by(rule("family-cousins.pl", clause(15))),
    bindings([binding("Child", ivan), binding("Branch", b), binding("Parent", eve)]),
    uses([
      proof(
        goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", eve), binding("Child", ivan)]),
        uses([
          proof(
            goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", eve), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

branch(judy, c).
why(
  branch(judy, c),
  proof(
    goal(branch(judy, c)), by(rule("family-cousins.pl", clause(15))),
    bindings([binding("Child", judy), binding("Branch", c), binding("Parent", frank)]),
    uses([
      proof(
        goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", frank), binding("Child", judy)]),
        uses([
          proof(
            goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", frank), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

generation(bob, 1).
why(
  generation(bob, 1),
  proof(
    goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
    uses([
      proof(
        goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", adam), binding("Child", bob)]),
        uses([
          proof(
            goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
      proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
    ])
  )
).

generation(carol, 1).
why(
  generation(carol, 1),
  proof(
    goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
    uses([
      proof(
        goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", adam), binding("Child", carol)]),
        uses([
          proof(
            goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
      proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
    ])
  )
).

generation(dave, 2).
why(
  generation(dave, 2),
  proof(
    goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
    uses([
      proof(
        goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", bob), binding("Child", dave)]),
        uses([
          proof(
            goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
        uses([
          proof(
            goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", adam), binding("Child", bob)]),
            uses([
              proof(
                goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
    ])
  )
).

generation(eve, 2).
why(
  generation(eve, 2),
  proof(
    goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
    uses([
      proof(
        goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", bob), binding("Child", eve)]),
        uses([
          proof(
            goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
        uses([
          proof(
            goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", adam), binding("Child", bob)]),
            uses([
              proof(
                goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
    ])
  )
).

generation(frank, 2).
why(
  generation(frank, 2),
  proof(
    goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
    uses([
      proof(
        goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", carol), binding("Child", frank)]),
        uses([
          proof(
            goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
        uses([
          proof(
            goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", adam), binding("Child", carol)]),
            uses([
              proof(
                goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
    ])
  )
).

generation(grace, 2).
why(
  generation(grace, 2),
  proof(
    goal(generation(grace, 2)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", grace), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
    uses([
      proof(
        goal(parent(carol, grace)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", carol), binding("Child", grace)]),
        uses([
          proof(
            goal(family_statement(carol, parent, grace)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", carol), binding("P", parent), binding("O", grace), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, grace)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
        uses([
          proof(
            goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", adam), binding("Child", carol)]),
            uses([
              proof(
                goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
    ])
  )
).

generation(heidi, 3).
why(
  generation(heidi, 3),
  proof(
    goal(generation(heidi, 3)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", heidi), binding("Next", 3), binding("Parent", dave), binding("Gen", 2)]),
    uses([
      proof(
        goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", dave), binding("Child", heidi)]),
        uses([
          proof(
            goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", dave)]),
            uses([
              proof(
                goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
    ])
  )
).

generation(ivan, 3).
why(
  generation(ivan, 3),
  proof(
    goal(generation(ivan, 3)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", ivan), binding("Next", 3), binding("Parent", eve), binding("Gen", 2)]),
    uses([
      proof(
        goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", eve), binding("Child", ivan)]),
        uses([
          proof(
            goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", eve)]),
            uses([
              proof(
                goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
    ])
  )
).

generation(judy, 3).
why(
  generation(judy, 3),
  proof(
    goal(generation(judy, 3)), by(rule("family-cousins.pl", clause(14))),
    bindings([binding("Child", judy), binding("Next", 3), binding("Parent", frank), binding("Gen", 2)]),
    uses([
      proof(
        goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
        bindings([binding("Parent", frank), binding("Child", judy)]),
        uses([
          proof(
            goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", frank)]),
            uses([
              proof(
                goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
    ])
  )
).

cousin(dave, frank).
why(
  cousin(dave, frank),
  proof(
    goal(cousin(dave, frank)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", dave), binding("Y", frank), binding("Gen", 2), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", dave)]),
            uses([
              proof(
                goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", frank)]),
            uses([
              proof(
                goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", dave), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", frank), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(dave, grace).
why(
  cousin(dave, grace),
  proof(
    goal(cousin(dave, grace)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", dave), binding("Y", grace), binding("Gen", 2), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", dave)]),
            uses([
              proof(
                goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(grace, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", grace), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, grace)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", grace)]),
            uses([
              proof(
                goal(family_statement(carol, parent, grace)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", grace), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, grace)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", dave), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(grace, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", grace), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(grace, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", grace), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), grace, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(eve, frank).
why(
  cousin(eve, frank),
  proof(
    goal(cousin(eve, frank)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", eve), binding("Y", frank), binding("Gen", 2), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", eve)]),
            uses([
              proof(
                goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", frank)]),
            uses([
              proof(
                goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", eve), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", frank), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(eve, grace).
why(
  cousin(eve, grace),
  proof(
    goal(cousin(eve, grace)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", eve), binding("Y", grace), binding("Gen", 2), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", eve)]),
            uses([
              proof(
                goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(grace, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", grace), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, grace)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", grace)]),
            uses([
              proof(
                goal(family_statement(carol, parent, grace)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", grace), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, grace)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", eve), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(grace, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", grace), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(grace, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", grace), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), grace, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(frank, dave).
why(
  cousin(frank, dave),
  proof(
    goal(cousin(frank, dave)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", frank), binding("Y", dave), binding("Gen", 2), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", frank)]),
            uses([
              proof(
                goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", dave)]),
            uses([
              proof(
                goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", frank), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", dave), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

cousin(frank, eve).
why(
  cousin(frank, eve),
  proof(
    goal(cousin(frank, eve)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", frank), binding("Y", eve), binding("Gen", 2), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", frank)]),
            uses([
              proof(
                goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", eve)]),
            uses([
              proof(
                goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", frank), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", eve), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

cousin(grace, dave).
why(
  cousin(grace, dave),
  proof(
    goal(cousin(grace, dave)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", grace), binding("Y", dave), binding("Gen", 2), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(grace, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", grace), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, grace)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", grace)]),
            uses([
              proof(
                goal(family_statement(carol, parent, grace)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", grace), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, grace)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", dave)]),
            uses([
              proof(
                goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(grace, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", grace), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(grace, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", grace), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), grace, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", dave), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

cousin(grace, eve).
why(
  cousin(grace, eve),
  proof(
    goal(cousin(grace, eve)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", grace), binding("Y", eve), binding("Gen", 2), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(grace, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", grace), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(carol, grace)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", carol), binding("Child", grace)]),
            uses([
              proof(
                goal(family_statement(carol, parent, grace)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", carol), binding("P", parent), binding("O", grace), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, grace)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", carol)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
        uses([
          proof(
            goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", bob), binding("Child", eve)]),
            uses([
              proof(
                goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
            uses([
              proof(
                goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", adam), binding("Child", bob)]),
                uses([
                  proof(
                    goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(grace, c)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", grace), binding("Branch", c)]),
        uses([
          proof(
            goal(family_statement(grace, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", grace), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), grace, seedBranch, c)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
        bindings([binding("Person", eve), binding("Branch", b)]),
        uses([
          proof(
            goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
            bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
            uses([
              proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
              proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

cousin(heidi, judy).
why(
  cousin(heidi, judy),
  proof(
    goal(cousin(heidi, judy)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", heidi), binding("Y", judy), binding("Gen", 3), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(heidi, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", heidi), binding("Next", 3), binding("Parent", dave), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", dave), binding("Child", heidi)]),
            uses([
              proof(
                goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", bob), binding("Child", dave)]),
                uses([
                  proof(
                    goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", bob)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(judy, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", judy), binding("Next", 3), binding("Parent", frank), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", carol), binding("Child", frank)]),
                uses([
                  proof(
                    goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", carol)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(heidi, b)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", heidi), binding("Branch", b), binding("Parent", dave)]),
        uses([
          proof(
            goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", dave), binding("Child", heidi)]),
            uses([
              proof(
                goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", dave), binding("Branch", b)]),
            uses([
              proof(
                goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(branch(judy, c)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", judy), binding("Branch", c), binding("Parent", frank)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", frank), binding("Branch", c)]),
            uses([
              proof(
                goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(ivan, judy).
why(
  cousin(ivan, judy),
  proof(
    goal(cousin(ivan, judy)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", ivan), binding("Y", judy), binding("Gen", 3), binding("BX", b), binding("BY", c)]),
    uses([
      proof(
        goal(generation(ivan, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", ivan), binding("Next", 3), binding("Parent", eve), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", eve), binding("Child", ivan)]),
            uses([
              proof(
                goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", bob), binding("Child", eve)]),
                uses([
                  proof(
                    goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", bob)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(judy, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", judy), binding("Next", 3), binding("Parent", frank), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", carol), binding("Child", frank)]),
                uses([
                  proof(
                    goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", carol)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(ivan, b)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", ivan), binding("Branch", b), binding("Parent", eve)]),
        uses([
          proof(
            goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", eve), binding("Child", ivan)]),
            uses([
              proof(
                goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", eve), binding("Branch", b)]),
            uses([
              proof(
                goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(branch(judy, c)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", judy), binding("Branch", c), binding("Parent", frank)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", frank), binding("Branch", c)]),
            uses([
              proof(
                goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(different(b, c)), by(fact("family-cousins.pl", clause(11))))
    ])
  )
).

cousin(judy, heidi).
why(
  cousin(judy, heidi),
  proof(
    goal(cousin(judy, heidi)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", judy), binding("Y", heidi), binding("Gen", 3), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(judy, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", judy), binding("Next", 3), binding("Parent", frank), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", carol), binding("Child", frank)]),
                uses([
                  proof(
                    goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", carol)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(heidi, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", heidi), binding("Next", 3), binding("Parent", dave), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", dave), binding("Child", heidi)]),
            uses([
              proof(
                goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(dave, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", dave), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(bob, dave)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", bob), binding("Child", dave)]),
                uses([
                  proof(
                    goal(family_statement(bob, parent, dave)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", bob), binding("P", parent), binding("O", dave), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, dave)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", bob)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(judy, c)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", judy), binding("Branch", c), binding("Parent", frank)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", frank), binding("Branch", c)]),
            uses([
              proof(
                goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(branch(heidi, b)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", heidi), binding("Branch", b), binding("Parent", dave)]),
        uses([
          proof(
            goal(parent(dave, heidi)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", dave), binding("Child", heidi)]),
            uses([
              proof(
                goal(family_statement(dave, parent, heidi)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", parent), binding("O", heidi), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, parent, heidi)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(dave, b)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", dave), binding("Branch", b)]),
            uses([
              proof(
                goal(family_statement(dave, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", dave), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), dave, seedBranch, b)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

cousin(judy, ivan).
why(
  cousin(judy, ivan),
  proof(
    goal(cousin(judy, ivan)), by(rule("family-cousins.pl", clause(17))),
    bindings([binding("X", judy), binding("Y", ivan), binding("Gen", 3), binding("BX", c), binding("BY", b)]),
    uses([
      proof(
        goal(generation(judy, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", judy), binding("Next", 3), binding("Parent", frank), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(frank, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", frank), binding("Next", 2), binding("Parent", carol), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(carol, frank)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", carol), binding("Child", frank)]),
                uses([
                  proof(
                    goal(family_statement(carol, parent, frank)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", carol), binding("P", parent), binding("O", frank), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), carol, parent, frank)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(carol, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", carol), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, carol)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", carol)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, carol)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", carol), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, carol)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(generation(ivan, 3)), by(rule("family-cousins.pl", clause(14))),
        bindings([binding("Child", ivan), binding("Next", 3), binding("Parent", eve), binding("Gen", 2)]),
        uses([
          proof(
            goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", eve), binding("Child", ivan)]),
            uses([
              proof(
                goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(generation(eve, 2)), by(rule("family-cousins.pl", clause(14))),
            bindings([binding("Child", eve), binding("Next", 2), binding("Parent", bob), binding("Gen", 1)]),
            uses([
              proof(
                goal(parent(bob, eve)), by(rule("family-cousins.pl", clause(9))),
                bindings([binding("Parent", bob), binding("Child", eve)]),
                uses([
                  proof(
                    goal(family_statement(bob, parent, eve)), by(rule("family-cousins.pl", clause(8))),
                    bindings([binding("S", bob), binding("P", parent), binding("O", eve), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                    uses([
                      proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                      proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), bob, parent, eve)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(generation(bob, 1)), by(rule("family-cousins.pl", clause(14))),
                bindings([binding("Child", bob), binding("Next", 1), binding("Parent", adam), binding("Gen", 0)]),
                uses([
                  proof(
                    goal(parent(adam, bob)), by(rule("family-cousins.pl", clause(9))),
                    bindings([binding("Parent", adam), binding("Child", bob)]),
                    uses([
                      proof(
                        goal(family_statement(adam, parent, bob)), by(rule("family-cousins.pl", clause(8))),
                        bindings([binding("S", adam), binding("P", parent), binding("O", bob), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                        uses([
                          proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                          proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), adam, parent, bob)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(generation(adam, 0)), by(fact("family-cousins.pl", clause(13)))),
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(branch(judy, c)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", judy), binding("Branch", c), binding("Parent", frank)]),
        uses([
          proof(
            goal(parent(frank, judy)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", frank), binding("Child", judy)]),
            uses([
              proof(
                goal(family_statement(frank, parent, judy)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", parent), binding("O", judy), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, parent, judy)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(frank, c)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", frank), binding("Branch", c)]),
            uses([
              proof(
                goal(family_statement(frank, seedBranch, c)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", frank), binding("P", seedBranch), binding("O", c), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), frank, seedBranch, c)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(branch(ivan, b)), by(rule("family-cousins.pl", clause(15))),
        bindings([binding("Child", ivan), binding("Branch", b), binding("Parent", eve)]),
        uses([
          proof(
            goal(parent(eve, ivan)), by(rule("family-cousins.pl", clause(9))),
            bindings([binding("Parent", eve), binding("Child", ivan)]),
            uses([
              proof(
                goal(family_statement(eve, parent, ivan)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", parent), binding("O", ivan), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, parent, ivan)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(branch(eve, b)), by(rule("family-cousins.pl", clause(10))),
            bindings([binding("Person", eve), binding("Branch", b)]),
            uses([
              proof(
                goal(family_statement(eve, seedBranch, b)), by(rule("family-cousins.pl", clause(8))),
                bindings([binding("S", eve), binding("P", seedBranch), binding("O", b), binding("Formula", (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))]),
                uses([
                  proof(goal(family_graph(familyGraph, (parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)))), by(fact("family-cousins.pl", clause(7)))),
                  proof(goal(formula_binary((parent(adam, bob), parent(adam, carol), parent(bob, dave), parent(bob, eve), parent(carol, frank), parent(carol, grace), parent(dave, heidi), parent(eve, ivan), parent(frank, judy), seedBranch(dave, b), seedBranch(eve, b), seedBranch(frank, c), seedBranch(grace, c)), eve, seedBranch, b)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(different(c, b)), by(fact("family-cousins.pl", clause(12))))
    ])
  )
).

