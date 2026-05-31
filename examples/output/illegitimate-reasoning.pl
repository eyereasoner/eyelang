fallacy(arg_affirming_consequent, affirming_consequent).
why(
  fallacy(arg_affirming_consequent, affirming_consequent),
  proof(
    goal(fallacy(arg_affirming_consequent, affirming_consequent)), by(rule("illegitimate-reasoning.pl", clause(28))),
    bindings([binding("A", arg_affirming_consequent), binding("Antecedent", rain), binding("Consequent", street_wet)]),
    uses([
      proof(goal(argument(arg_affirming_consequent)), by(fact("illegitimate-reasoning.pl", clause(8)))),
      proof(goal(implication(arg_affirming_consequent, rain, street_wet)), by(fact("illegitimate-reasoning.pl", clause(9)))),
      proof(goal(observed(arg_affirming_consequent, street_wet)), by(fact("illegitimate-reasoning.pl", clause(10)))),
      proof(goal(concludes(arg_affirming_consequent, rain)), by(fact("illegitimate-reasoning.pl", clause(11))))
    ])
  )
).

fallacy(arg_denying_antecedent, denying_antecedent).
why(
  fallacy(arg_denying_antecedent, denying_antecedent),
  proof(
    goal(fallacy(arg_denying_antecedent, denying_antecedent)), by(rule("illegitimate-reasoning.pl", clause(29))),
    bindings([binding("A", arg_denying_antecedent), binding("Antecedent", key_present), binding("Consequent", door_opens)]),
    uses([
      proof(goal(argument(arg_denying_antecedent)), by(fact("illegitimate-reasoning.pl", clause(12)))),
      proof(goal(implication(arg_denying_antecedent, key_present, door_opens)), by(fact("illegitimate-reasoning.pl", clause(13)))),
      proof(goal(observed(arg_denying_antecedent, neg(key_present))), by(fact("illegitimate-reasoning.pl", clause(14)))),
      proof(goal(concludes(arg_denying_antecedent, neg(door_opens))), by(fact("illegitimate-reasoning.pl", clause(15))))
    ])
  )
).

fallacy(arg_hasty_generalization, hasty_generalization).
why(
  fallacy(arg_hasty_generalization, hasty_generalization),
  proof(
    goal(fallacy(arg_hasty_generalization, hasty_generalization)), by(rule("illegitimate-reasoning.pl", clause(30))),
    bindings([binding("A", arg_hasty_generalization), binding("N", 3), binding("Min", 30), binding("__anon0", crows), binding("__anon1", black)]),
    uses([
      proof(goal(argument(arg_hasty_generalization)), by(fact("illegitimate-reasoning.pl", clause(16)))),
      proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17)))),
      proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18)))),
      proof(goal(lt(3, 30)), by(builtin(lt, 2))),
      proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
    ])
  )
).

fallacy(arg_false_dilemma, false_dilemma).
why(
  fallacy(arg_false_dilemma, false_dilemma),
  proof(
    goal(fallacy(arg_false_dilemma, false_dilemma)), by(rule("illegitimate-reasoning.pl", clause(31))),
    bindings([binding("A", arg_false_dilemma), binding("__anon2", [approve_now, reject_forever]), binding("__anon3", revise_proposal), binding("__anon4", approve_now)]),
    uses([
      proof(goal(argument(arg_false_dilemma)), by(fact("illegitimate-reasoning.pl", clause(20)))),
      proof(goal(presented_alternatives(arg_false_dilemma, [approve_now, reject_forever])), by(fact("illegitimate-reasoning.pl", clause(21)))),
      proof(goal(omitted_alternative(arg_false_dilemma, revise_proposal)), by(fact("illegitimate-reasoning.pl", clause(22)))),
      proof(goal(concludes(arg_false_dilemma, approve_now)), by(fact("illegitimate-reasoning.pl", clause(23))))
    ])
  )
).

type(arg_affirming_consequent, illegitimate_reasoning).
why(
  type(arg_affirming_consequent, illegitimate_reasoning),
  proof(
    goal(type(arg_affirming_consequent, illegitimate_reasoning)), by(rule("illegitimate-reasoning.pl", clause(36))),
    bindings([binding("A", arg_affirming_consequent), binding("__anon5", affirming_consequent)]),
    uses([
      proof(
        goal(fallacy(arg_affirming_consequent, affirming_consequent)), by(rule("illegitimate-reasoning.pl", clause(28))),
        bindings([binding("A", arg_affirming_consequent), binding("Antecedent", rain), binding("Consequent", street_wet)]),
        uses([
          proof(goal(argument(arg_affirming_consequent)), by(fact("illegitimate-reasoning.pl", clause(8)))),
          proof(goal(implication(arg_affirming_consequent, rain, street_wet)), by(fact("illegitimate-reasoning.pl", clause(9)))),
          proof(goal(observed(arg_affirming_consequent, street_wet)), by(fact("illegitimate-reasoning.pl", clause(10)))),
          proof(goal(concludes(arg_affirming_consequent, rain)), by(fact("illegitimate-reasoning.pl", clause(11))))
        ])
      )
    ])
  )
).

type(arg_denying_antecedent, illegitimate_reasoning).
why(
  type(arg_denying_antecedent, illegitimate_reasoning),
  proof(
    goal(type(arg_denying_antecedent, illegitimate_reasoning)), by(rule("illegitimate-reasoning.pl", clause(36))),
    bindings([binding("A", arg_denying_antecedent), binding("__anon5", denying_antecedent)]),
    uses([
      proof(
        goal(fallacy(arg_denying_antecedent, denying_antecedent)), by(rule("illegitimate-reasoning.pl", clause(29))),
        bindings([binding("A", arg_denying_antecedent), binding("Antecedent", key_present), binding("Consequent", door_opens)]),
        uses([
          proof(goal(argument(arg_denying_antecedent)), by(fact("illegitimate-reasoning.pl", clause(12)))),
          proof(goal(implication(arg_denying_antecedent, key_present, door_opens)), by(fact("illegitimate-reasoning.pl", clause(13)))),
          proof(goal(observed(arg_denying_antecedent, neg(key_present))), by(fact("illegitimate-reasoning.pl", clause(14)))),
          proof(goal(concludes(arg_denying_antecedent, neg(door_opens))), by(fact("illegitimate-reasoning.pl", clause(15))))
        ])
      )
    ])
  )
).

type(arg_hasty_generalization, illegitimate_reasoning).
why(
  type(arg_hasty_generalization, illegitimate_reasoning),
  proof(
    goal(type(arg_hasty_generalization, illegitimate_reasoning)), by(rule("illegitimate-reasoning.pl", clause(36))),
    bindings([binding("A", arg_hasty_generalization), binding("__anon5", hasty_generalization)]),
    uses([
      proof(
        goal(fallacy(arg_hasty_generalization, hasty_generalization)), by(rule("illegitimate-reasoning.pl", clause(30))),
        bindings([binding("A", arg_hasty_generalization), binding("N", 3), binding("Min", 30), binding("__anon0", crows), binding("__anon1", black)]),
        uses([
          proof(goal(argument(arg_hasty_generalization)), by(fact("illegitimate-reasoning.pl", clause(16)))),
          proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17)))),
          proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18)))),
          proof(goal(lt(3, 30)), by(builtin(lt, 2))),
          proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
        ])
      )
    ])
  )
).

type(arg_false_dilemma, illegitimate_reasoning).
why(
  type(arg_false_dilemma, illegitimate_reasoning),
  proof(
    goal(type(arg_false_dilemma, illegitimate_reasoning)), by(rule("illegitimate-reasoning.pl", clause(36))),
    bindings([binding("A", arg_false_dilemma), binding("__anon5", false_dilemma)]),
    uses([
      proof(
        goal(fallacy(arg_false_dilemma, false_dilemma)), by(rule("illegitimate-reasoning.pl", clause(31))),
        bindings([binding("A", arg_false_dilemma), binding("__anon2", [approve_now, reject_forever]), binding("__anon3", revise_proposal), binding("__anon4", approve_now)]),
        uses([
          proof(goal(argument(arg_false_dilemma)), by(fact("illegitimate-reasoning.pl", clause(20)))),
          proof(goal(presented_alternatives(arg_false_dilemma, [approve_now, reject_forever])), by(fact("illegitimate-reasoning.pl", clause(21)))),
          proof(goal(omitted_alternative(arg_false_dilemma, revise_proposal)), by(fact("illegitimate-reasoning.pl", clause(22)))),
          proof(goal(concludes(arg_false_dilemma, approve_now)), by(fact("illegitimate-reasoning.pl", clause(23))))
        ])
      )
    ])
  )
).

conclusion(arg_affirming_consequent, rain).
why(
  conclusion(arg_affirming_consequent, rain),
  proof(
    goal(conclusion(arg_affirming_consequent, rain)), by(rule("illegitimate-reasoning.pl", clause(37))),
    bindings([binding("A", arg_affirming_consequent), binding("C", rain), binding("__anon6", affirming_consequent)]),
    uses([
      proof(
        goal(fallacy(arg_affirming_consequent, affirming_consequent)), by(rule("illegitimate-reasoning.pl", clause(28))),
        bindings([binding("A", arg_affirming_consequent), binding("Antecedent", rain), binding("Consequent", street_wet)]),
        uses([
          proof(goal(argument(arg_affirming_consequent)), by(fact("illegitimate-reasoning.pl", clause(8)))),
          proof(goal(implication(arg_affirming_consequent, rain, street_wet)), by(fact("illegitimate-reasoning.pl", clause(9)))),
          proof(goal(observed(arg_affirming_consequent, street_wet)), by(fact("illegitimate-reasoning.pl", clause(10)))),
          proof(goal(concludes(arg_affirming_consequent, rain)), by(fact("illegitimate-reasoning.pl", clause(11))))
        ])
      ),
      proof(goal(concludes(arg_affirming_consequent, rain)), by(fact("illegitimate-reasoning.pl", clause(11))))
    ])
  )
).

conclusion(arg_denying_antecedent, neg(door_opens)).
why(
  conclusion(arg_denying_antecedent, neg(door_opens)),
  proof(
    goal(conclusion(arg_denying_antecedent, neg(door_opens))), by(rule("illegitimate-reasoning.pl", clause(37))),
    bindings([binding("A", arg_denying_antecedent), binding("C", neg(door_opens)), binding("__anon6", denying_antecedent)]),
    uses([
      proof(
        goal(fallacy(arg_denying_antecedent, denying_antecedent)), by(rule("illegitimate-reasoning.pl", clause(29))),
        bindings([binding("A", arg_denying_antecedent), binding("Antecedent", key_present), binding("Consequent", door_opens)]),
        uses([
          proof(goal(argument(arg_denying_antecedent)), by(fact("illegitimate-reasoning.pl", clause(12)))),
          proof(goal(implication(arg_denying_antecedent, key_present, door_opens)), by(fact("illegitimate-reasoning.pl", clause(13)))),
          proof(goal(observed(arg_denying_antecedent, neg(key_present))), by(fact("illegitimate-reasoning.pl", clause(14)))),
          proof(goal(concludes(arg_denying_antecedent, neg(door_opens))), by(fact("illegitimate-reasoning.pl", clause(15))))
        ])
      ),
      proof(goal(concludes(arg_denying_antecedent, neg(door_opens))), by(fact("illegitimate-reasoning.pl", clause(15))))
    ])
  )
).

conclusion(arg_hasty_generalization, all(crows, black)).
why(
  conclusion(arg_hasty_generalization, all(crows, black)),
  proof(
    goal(conclusion(arg_hasty_generalization, all(crows, black))), by(rule("illegitimate-reasoning.pl", clause(37))),
    bindings([binding("A", arg_hasty_generalization), binding("C", all(crows, black)), binding("__anon6", hasty_generalization)]),
    uses([
      proof(
        goal(fallacy(arg_hasty_generalization, hasty_generalization)), by(rule("illegitimate-reasoning.pl", clause(30))),
        bindings([binding("A", arg_hasty_generalization), binding("N", 3), binding("Min", 30), binding("__anon0", crows), binding("__anon1", black)]),
        uses([
          proof(goal(argument(arg_hasty_generalization)), by(fact("illegitimate-reasoning.pl", clause(16)))),
          proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17)))),
          proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18)))),
          proof(goal(lt(3, 30)), by(builtin(lt, 2))),
          proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
        ])
      ),
      proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
    ])
  )
).

conclusion(arg_false_dilemma, approve_now).
why(
  conclusion(arg_false_dilemma, approve_now),
  proof(
    goal(conclusion(arg_false_dilemma, approve_now)), by(rule("illegitimate-reasoning.pl", clause(37))),
    bindings([binding("A", arg_false_dilemma), binding("C", approve_now), binding("__anon6", false_dilemma)]),
    uses([
      proof(
        goal(fallacy(arg_false_dilemma, false_dilemma)), by(rule("illegitimate-reasoning.pl", clause(31))),
        bindings([binding("A", arg_false_dilemma), binding("__anon2", [approve_now, reject_forever]), binding("__anon3", revise_proposal), binding("__anon4", approve_now)]),
        uses([
          proof(goal(argument(arg_false_dilemma)), by(fact("illegitimate-reasoning.pl", clause(20)))),
          proof(goal(presented_alternatives(arg_false_dilemma, [approve_now, reject_forever])), by(fact("illegitimate-reasoning.pl", clause(21)))),
          proof(goal(omitted_alternative(arg_false_dilemma, revise_proposal)), by(fact("illegitimate-reasoning.pl", clause(22)))),
          proof(goal(concludes(arg_false_dilemma, approve_now)), by(fact("illegitimate-reasoning.pl", clause(23))))
        ])
      ),
      proof(goal(concludes(arg_false_dilemma, approve_now)), by(fact("illegitimate-reasoning.pl", clause(23))))
    ])
  )
).

sampleSize(arg_hasty_generalization, 3).
why(
  sampleSize(arg_hasty_generalization, 3),
  proof(
    goal(sampleSize(arg_hasty_generalization, 3)), by(rule("illegitimate-reasoning.pl", clause(39))),
    bindings([binding("A", arg_hasty_generalization), binding("N", 3)]),
    uses([
      proof(
        goal(fallacy(arg_hasty_generalization, hasty_generalization)), by(rule("illegitimate-reasoning.pl", clause(30))),
        bindings([binding("A", arg_hasty_generalization), binding("N", 3), binding("Min", 30), binding("__anon0", crows), binding("__anon1", black)]),
        uses([
          proof(goal(argument(arg_hasty_generalization)), by(fact("illegitimate-reasoning.pl", clause(16)))),
          proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17)))),
          proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18)))),
          proof(goal(lt(3, 30)), by(builtin(lt, 2))),
          proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
        ])
      ),
      proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17))))
    ])
  )
).

requiredSampleSize(arg_hasty_generalization, 30).
why(
  requiredSampleSize(arg_hasty_generalization, 30),
  proof(
    goal(requiredSampleSize(arg_hasty_generalization, 30)), by(rule("illegitimate-reasoning.pl", clause(40))),
    bindings([binding("A", arg_hasty_generalization), binding("Min", 30)]),
    uses([
      proof(
        goal(fallacy(arg_hasty_generalization, hasty_generalization)), by(rule("illegitimate-reasoning.pl", clause(30))),
        bindings([binding("A", arg_hasty_generalization), binding("N", 3), binding("Min", 30), binding("__anon0", crows), binding("__anon1", black)]),
        uses([
          proof(goal(argument(arg_hasty_generalization)), by(fact("illegitimate-reasoning.pl", clause(16)))),
          proof(goal(sample_size(arg_hasty_generalization, 3)), by(fact("illegitimate-reasoning.pl", clause(17)))),
          proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18)))),
          proof(goal(lt(3, 30)), by(builtin(lt, 2))),
          proof(goal(concludes(arg_hasty_generalization, all(crows, black))), by(fact("illegitimate-reasoning.pl", clause(19))))
        ])
      ),
      proof(goal(required_sample_size(arg_hasty_generalization, 30)), by(fact("illegitimate-reasoning.pl", clause(18))))
    ])
  )
).

omittedAlternative(arg_false_dilemma, revise_proposal).
why(
  omittedAlternative(arg_false_dilemma, revise_proposal),
  proof(
    goal(omittedAlternative(arg_false_dilemma, revise_proposal)), by(rule("illegitimate-reasoning.pl", clause(41))),
    bindings([binding("A", arg_false_dilemma), binding("Alt", revise_proposal)]),
    uses([
      proof(
        goal(fallacy(arg_false_dilemma, false_dilemma)), by(rule("illegitimate-reasoning.pl", clause(31))),
        bindings([binding("A", arg_false_dilemma), binding("__anon2", [approve_now, reject_forever]), binding("__anon3", revise_proposal), binding("__anon4", approve_now)]),
        uses([
          proof(goal(argument(arg_false_dilemma)), by(fact("illegitimate-reasoning.pl", clause(20)))),
          proof(goal(presented_alternatives(arg_false_dilemma, [approve_now, reject_forever])), by(fact("illegitimate-reasoning.pl", clause(21)))),
          proof(goal(omitted_alternative(arg_false_dilemma, revise_proposal)), by(fact("illegitimate-reasoning.pl", clause(22)))),
          proof(goal(concludes(arg_false_dilemma, approve_now)), by(fact("illegitimate-reasoning.pl", clause(23))))
        ])
      ),
      proof(goal(omitted_alternative(arg_false_dilemma, revise_proposal)), by(fact("illegitimate-reasoning.pl", clause(22))))
    ])
  )
).

