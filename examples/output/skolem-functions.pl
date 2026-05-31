type(skolem_observation(alice, glucose), observation).
why(
  type(skolem_observation(alice, glucose), observation),
  proof(
    goal(type(skolem_observation(alice, glucose), observation)),
    by(rule("skolem-functions.pl", clause(13))),
    bindings([binding("Patient", alice), binding("Test", glucose), binding("_Value", 6.8)]),
    uses([
      proof(
        goal(test_result(alice, glucose, 6.8)),
        by(fact("skolem-functions.pl", clause(8)))
      )
    ])
  )
).

type(skolem_observation(alice, cholesterol), observation).
why(
  type(skolem_observation(alice, cholesterol), observation),
  proof(
    goal(type(skolem_observation(alice, cholesterol), observation)),
    by(rule("skolem-functions.pl", clause(13))),
    bindings([binding("Patient", alice), binding("Test", cholesterol), binding("_Value", 4.2)]),
    uses([
      proof(
        goal(test_result(alice, cholesterol, 4.2)),
        by(fact("skolem-functions.pl", clause(9)))
      )
    ])
  )
).

type(skolem_observation(bob, glucose), observation).
why(
  type(skolem_observation(bob, glucose), observation),
  proof(
    goal(type(skolem_observation(bob, glucose), observation)),
    by(rule("skolem-functions.pl", clause(13))),
    bindings([binding("Patient", bob), binding("Test", glucose), binding("_Value", 5.1)]),
    uses([
      proof(
        goal(test_result(bob, glucose, 5.1)),
        by(fact("skolem-functions.pl", clause(10)))
      )
    ])
  )
).

type(skolem_alert(alice, glucose), highGlucoseAlert).
why(
  type(skolem_alert(alice, glucose), highGlucoseAlert),
  proof(
    goal(type(skolem_alert(alice, glucose), highGlucoseAlert)),
    by(rule("skolem-functions.pl", clause(17))),
    bindings([binding("Patient", alice)]),
    uses([
      proof(
        goal(high_glucose(alice)),
        by(rule("skolem-functions.pl", clause(11))),
        bindings([binding("Patient", alice), binding("Value", 6.8)]),
        uses([
          proof(
            goal(test_result(alice, glucose, 6.8)),
            by(fact("skolem-functions.pl", clause(8)))
          ),
          proof(
            goal(gt(6.8, 6.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

patient(skolem_observation(alice, glucose), alice).
why(
  patient(skolem_observation(alice, glucose), alice),
  proof(
    goal(patient(skolem_observation(alice, glucose), alice)),
    by(rule("skolem-functions.pl", clause(14))),
    bindings([binding("Patient", alice), binding("Test", glucose), binding("_Value", 6.8)]),
    uses([
      proof(
        goal(test_result(alice, glucose, 6.8)),
        by(fact("skolem-functions.pl", clause(8)))
      )
    ])
  )
).

patient(skolem_observation(alice, cholesterol), alice).
why(
  patient(skolem_observation(alice, cholesterol), alice),
  proof(
    goal(patient(skolem_observation(alice, cholesterol), alice)),
    by(rule("skolem-functions.pl", clause(14))),
    bindings([binding("Patient", alice), binding("Test", cholesterol), binding("_Value", 4.2)]),
    uses([
      proof(
        goal(test_result(alice, cholesterol, 4.2)),
        by(fact("skolem-functions.pl", clause(9)))
      )
    ])
  )
).

patient(skolem_observation(bob, glucose), bob).
why(
  patient(skolem_observation(bob, glucose), bob),
  proof(
    goal(patient(skolem_observation(bob, glucose), bob)),
    by(rule("skolem-functions.pl", clause(14))),
    bindings([binding("Patient", bob), binding("Test", glucose), binding("_Value", 5.1)]),
    uses([
      proof(
        goal(test_result(bob, glucose, 5.1)),
        by(fact("skolem-functions.pl", clause(10)))
      )
    ])
  )
).

test(skolem_observation(alice, glucose), glucose).
why(
  test(skolem_observation(alice, glucose), glucose),
  proof(
    goal(test(skolem_observation(alice, glucose), glucose)),
    by(rule("skolem-functions.pl", clause(15))),
    bindings([binding("Patient", alice), binding("Test", glucose), binding("_Value", 6.8)]),
    uses([
      proof(
        goal(test_result(alice, glucose, 6.8)),
        by(fact("skolem-functions.pl", clause(8)))
      )
    ])
  )
).

test(skolem_observation(alice, cholesterol), cholesterol).
why(
  test(skolem_observation(alice, cholesterol), cholesterol),
  proof(
    goal(test(skolem_observation(alice, cholesterol), cholesterol)),
    by(rule("skolem-functions.pl", clause(15))),
    bindings([binding("Patient", alice), binding("Test", cholesterol), binding("_Value", 4.2)]),
    uses([
      proof(
        goal(test_result(alice, cholesterol, 4.2)),
        by(fact("skolem-functions.pl", clause(9)))
      )
    ])
  )
).

test(skolem_observation(bob, glucose), glucose).
why(
  test(skolem_observation(bob, glucose), glucose),
  proof(
    goal(test(skolem_observation(bob, glucose), glucose)),
    by(rule("skolem-functions.pl", clause(15))),
    bindings([binding("Patient", bob), binding("Test", glucose), binding("_Value", 5.1)]),
    uses([
      proof(
        goal(test_result(bob, glucose, 5.1)),
        by(fact("skolem-functions.pl", clause(10)))
      )
    ])
  )
).

value(skolem_observation(alice, glucose), 6.8).
why(
  value(skolem_observation(alice, glucose), 6.8),
  proof(
    goal(value(skolem_observation(alice, glucose), 6.8)),
    by(rule("skolem-functions.pl", clause(16))),
    bindings([binding("Patient", alice), binding("Test", glucose), binding("Value", 6.8)]),
    uses([
      proof(
        goal(test_result(alice, glucose, 6.8)),
        by(fact("skolem-functions.pl", clause(8)))
      )
    ])
  )
).

value(skolem_observation(alice, cholesterol), 4.2).
why(
  value(skolem_observation(alice, cholesterol), 4.2),
  proof(
    goal(value(skolem_observation(alice, cholesterol), 4.2)),
    by(rule("skolem-functions.pl", clause(16))),
    bindings([binding("Patient", alice), binding("Test", cholesterol), binding("Value", 4.2)]),
    uses([
      proof(
        goal(test_result(alice, cholesterol, 4.2)),
        by(fact("skolem-functions.pl", clause(9)))
      )
    ])
  )
).

value(skolem_observation(bob, glucose), 5.1).
why(
  value(skolem_observation(bob, glucose), 5.1),
  proof(
    goal(value(skolem_observation(bob, glucose), 5.1)),
    by(rule("skolem-functions.pl", clause(16))),
    bindings([binding("Patient", bob), binding("Test", glucose), binding("Value", 5.1)]),
    uses([
      proof(
        goal(test_result(bob, glucose, 5.1)),
        by(fact("skolem-functions.pl", clause(10)))
      )
    ])
  )
).

about(skolem_alert(alice, glucose), skolem_observation(alice, glucose)).
why(
  about(skolem_alert(alice, glucose), skolem_observation(alice, glucose)),
  proof(
    goal(about(skolem_alert(alice, glucose), skolem_observation(alice, glucose))),
    by(rule("skolem-functions.pl", clause(18))),
    bindings([binding("Patient", alice)]),
    uses([
      proof(
        goal(high_glucose(alice)),
        by(rule("skolem-functions.pl", clause(11))),
        bindings([binding("Patient", alice), binding("Value", 6.8)]),
        uses([
          proof(
            goal(test_result(alice, glucose, 6.8)),
            by(fact("skolem-functions.pl", clause(8)))
          ),
          proof(
            goal(gt(6.8, 6.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

sameInputsSameId(skolemDemo, true).
why(
  sameInputsSameId(skolemDemo, true),
  proof(
    goal(sameInputsSameId(skolemDemo, true)),
    by(rule("skolem-functions.pl", clause(19))),
    uses([
      proof(
        goal(eq(skolem_observation(alice, glucose), skolem_observation(alice, glucose))),
        by(builtin(eq, 2))
      )
    ])
  )
).

noObservationClash(skolemDemo, true).
why(
  noObservationClash(skolemDemo, true),
  proof(
    goal(noObservationClash(skolemDemo, true)),
    by(rule("skolem-functions.pl", clause(20))),
    uses([
      proof(
        goal(neq(skolem_observation(alice, glucose), skolem_observation(alice, cholesterol))),
        by(builtin(neq, 2))
      ),
      proof(
        goal(neq(skolem_observation(alice, glucose), skolem_observation(bob, glucose))),
        by(builtin(neq, 2))
      )
    ])
  )
).

