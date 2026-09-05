status(no_mandate, insufficient_control).
why(
  status(no_mandate, insufficient_control),
  proof(
    goal(status(no_mandate, insufficient_control)),
    by(rule("epidemic-policy.pl", clause(20))),
    bindings([binding("P", no_mandate), binding("R", 1.4)]),
    uses([
      proof(
        goal(policy(no_mandate)),
        by(fact("epidemic-policy.pl", clause(1)))
      ),
      proof(
        goal(risk_score(no_mandate, 1.4)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", no_mandate), binding("R", 1.4), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 1.0), binding("A", 1.4)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(no_mandate, 1.0)),
            by(fact("epidemic-policy.pl", clause(6)))
          ),
          proof(
            goal(mask_factor(no_mandate, 1.0)),
            by(fact("epidemic-policy.pl", clause(10)))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          )
        ])
      ),
      proof(
        goal(>(1.4, 0.75)),
        by(builtin(>, 2))
      )
    ])
  )
).

status(vaccination_campaign, insufficient_control).
why(
  status(vaccination_campaign, insufficient_control),
  proof(
    goal(status(vaccination_campaign, insufficient_control)),
    by(rule("epidemic-policy.pl", clause(20))),
    bindings([binding("P", vaccination_campaign), binding("R", 0.77)]),
    uses([
      proof(
        goal(policy(vaccination_campaign)),
        by(fact("epidemic-policy.pl", clause(2)))
      ),
      proof(
        goal(risk_score(vaccination_campaign, 0.77)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", vaccination_campaign), binding("R", 0.77), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 1.0), binding("A", 0.77)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(vaccination_campaign, 0.55)),
            by(fact("epidemic-policy.pl", clause(7)))
          ),
          proof(
            goal(mask_factor(vaccination_campaign, 1.0)),
            by(fact("epidemic-policy.pl", clause(11)))
          ),
          proof(
            goal(is(0.77, *(1.4, 0.55))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(0.77, *(0.77, 1.0))),
            by(builtin(is, 2))
          )
        ])
      ),
      proof(
        goal(>(0.77, 0.75)),
        by(builtin(>, 2))
      )
    ])
  )
).

status(indoor_masks, insufficient_control).
why(
  status(indoor_masks, insufficient_control),
  proof(
    goal(status(indoor_masks, insufficient_control)),
    by(rule("epidemic-policy.pl", clause(20))),
    bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999)]),
    uses([
      proof(
        goal(policy(indoor_masks)),
        by(fact("epidemic-policy.pl", clause(3)))
      ),
      proof(
        goal(risk_score(indoor_masks, 0.9099999999999999)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 0.65), binding("A", 1.4)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(indoor_masks, 1.0)),
            by(fact("epidemic-policy.pl", clause(8)))
          ),
          proof(
            goal(mask_factor(indoor_masks, 0.65)),
            by(fact("epidemic-policy.pl", clause(12)))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(0.9099999999999999, *(1.4, 0.65))),
            by(builtin(is, 2))
          )
        ])
      ),
      proof(
        goal(>(0.9099999999999999, 0.75)),
        by(builtin(>, 2))
      )
    ])
  )
).

status(vaccination_and_masks, acceptable_control).
why(
  status(vaccination_and_masks, acceptable_control),
  proof(
    goal(status(vaccination_and_masks, acceptable_control)),
    by(rule("epidemic-policy.pl", clause(21))),
    bindings([binding("P", vaccination_and_masks)]),
    uses([
      proof(
        goal(acceptable(vaccination_and_masks)),
        by(rule("epidemic-policy.pl", clause(19))),
        bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001)]),
        uses([
          proof(
            goal(risk_score(vaccination_and_masks, 0.5005000000000001)),
            by(rule("epidemic-policy.pl", clause(18))),
            bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 0.65), binding("A", 0.77)]),
            uses([
              proof(
                goal(base_risk(1.4)),
                by(fact("epidemic-policy.pl", clause(5)))
              ),
              proof(
                goal(vaccination_factor(vaccination_and_masks, 0.55)),
                by(fact("epidemic-policy.pl", clause(9)))
              ),
              proof(
                goal(mask_factor(vaccination_and_masks, 0.65)),
                by(fact("epidemic-policy.pl", clause(13)))
              ),
              proof(
                goal(is(0.77, *(1.4, 0.55))),
                by(builtin(is, 2))
              ),
              proof(
                goal(is(0.5005000000000001, *(0.77, 0.65))),
                by(builtin(is, 2))
              )
            ])
          ),
          proof(
            goal(=<(0.5005000000000001, 0.75)),
            by(builtin(=<, 2))
          )
        ])
      )
    ])
  )
).

riskScore(no_mandate, 1.4).
why(
  riskScore(no_mandate, 1.4),
  proof(
    goal(riskScore(no_mandate, 1.4)),
    by(rule("epidemic-policy.pl", clause(23))),
    bindings([binding("P", no_mandate), binding("R", 1.4)]),
    uses([
      proof(
        goal(risk_score(no_mandate, 1.4)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", no_mandate), binding("R", 1.4), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 1.0), binding("A", 1.4)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(no_mandate, 1.0)),
            by(fact("epidemic-policy.pl", clause(6)))
          ),
          proof(
            goal(mask_factor(no_mandate, 1.0)),
            by(fact("epidemic-policy.pl", clause(10)))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          )
        ])
      )
    ])
  )
).

riskScore(vaccination_campaign, 0.77).
why(
  riskScore(vaccination_campaign, 0.77),
  proof(
    goal(riskScore(vaccination_campaign, 0.77)),
    by(rule("epidemic-policy.pl", clause(23))),
    bindings([binding("P", vaccination_campaign), binding("R", 0.77)]),
    uses([
      proof(
        goal(risk_score(vaccination_campaign, 0.77)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", vaccination_campaign), binding("R", 0.77), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 1.0), binding("A", 0.77)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(vaccination_campaign, 0.55)),
            by(fact("epidemic-policy.pl", clause(7)))
          ),
          proof(
            goal(mask_factor(vaccination_campaign, 1.0)),
            by(fact("epidemic-policy.pl", clause(11)))
          ),
          proof(
            goal(is(0.77, *(1.4, 0.55))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(0.77, *(0.77, 1.0))),
            by(builtin(is, 2))
          )
        ])
      )
    ])
  )
).

riskScore(indoor_masks, 0.9099999999999999).
why(
  riskScore(indoor_masks, 0.9099999999999999),
  proof(
    goal(riskScore(indoor_masks, 0.9099999999999999)),
    by(rule("epidemic-policy.pl", clause(23))),
    bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999)]),
    uses([
      proof(
        goal(risk_score(indoor_masks, 0.9099999999999999)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 0.65), binding("A", 1.4)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(indoor_masks, 1.0)),
            by(fact("epidemic-policy.pl", clause(8)))
          ),
          proof(
            goal(mask_factor(indoor_masks, 0.65)),
            by(fact("epidemic-policy.pl", clause(12)))
          ),
          proof(
            goal(is(1.4, *(1.4, 1.0))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(0.9099999999999999, *(1.4, 0.65))),
            by(builtin(is, 2))
          )
        ])
      )
    ])
  )
).

riskScore(vaccination_and_masks, 0.5005000000000001).
why(
  riskScore(vaccination_and_masks, 0.5005000000000001),
  proof(
    goal(riskScore(vaccination_and_masks, 0.5005000000000001)),
    by(rule("epidemic-policy.pl", clause(23))),
    bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001)]),
    uses([
      proof(
        goal(risk_score(vaccination_and_masks, 0.5005000000000001)),
        by(rule("epidemic-policy.pl", clause(18))),
        bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 0.65), binding("A", 0.77)]),
        uses([
          proof(
            goal(base_risk(1.4)),
            by(fact("epidemic-policy.pl", clause(5)))
          ),
          proof(
            goal(vaccination_factor(vaccination_and_masks, 0.55)),
            by(fact("epidemic-policy.pl", clause(9)))
          ),
          proof(
            goal(mask_factor(vaccination_and_masks, 0.65)),
            by(fact("epidemic-policy.pl", clause(13)))
          ),
          proof(
            goal(is(0.77, *(1.4, 0.55))),
            by(builtin(is, 2))
          ),
          proof(
            goal(is(0.5005000000000001, *(0.77, 0.65))),
            by(builtin(is, 2))
          )
        ])
      )
    ])
  )
).

cost(no_mandate, 0).
why(
  cost(no_mandate, 0),
  proof(
    goal(cost(no_mandate, 0)),
    by(rule("epidemic-policy.pl", clause(24))),
    bindings([binding("P", no_mandate), binding("C", 0)]),
    uses([
      proof(
        goal(policy_cost(no_mandate, 0)),
        by(fact("epidemic-policy.pl", clause(14)))
      )
    ])
  )
).

cost(vaccination_campaign, 3).
why(
  cost(vaccination_campaign, 3),
  proof(
    goal(cost(vaccination_campaign, 3)),
    by(rule("epidemic-policy.pl", clause(24))),
    bindings([binding("P", vaccination_campaign), binding("C", 3)]),
    uses([
      proof(
        goal(policy_cost(vaccination_campaign, 3)),
        by(fact("epidemic-policy.pl", clause(15)))
      )
    ])
  )
).

cost(indoor_masks, 2).
why(
  cost(indoor_masks, 2),
  proof(
    goal(cost(indoor_masks, 2)),
    by(rule("epidemic-policy.pl", clause(24))),
    bindings([binding("P", indoor_masks), binding("C", 2)]),
    uses([
      proof(
        goal(policy_cost(indoor_masks, 2)),
        by(fact("epidemic-policy.pl", clause(16)))
      )
    ])
  )
).

cost(vaccination_and_masks, 5).
why(
  cost(vaccination_and_masks, 5),
  proof(
    goal(cost(vaccination_and_masks, 5)),
    by(rule("epidemic-policy.pl", clause(24))),
    bindings([binding("P", vaccination_and_masks), binding("C", 5)]),
    uses([
      proof(
        goal(policy_cost(vaccination_and_masks, 5)),
        by(fact("epidemic-policy.pl", clause(17)))
      )
    ])
  )
).

recommendedPolicy(epidemic_policy, vaccination_and_masks).
why(
  recommendedPolicy(epidemic_policy, vaccination_and_masks),
  proof(
    goal(recommendedPolicy(epidemic_policy, vaccination_and_masks)),
    by(rule("epidemic-policy.pl", clause(25))),
    bindings([binding("P", vaccination_and_masks)]),
    uses([
      proof(
        goal(recommended(vaccination_and_masks)),
        by(rule("epidemic-policy.pl", clause(22))),
        uses([
          proof(
            goal(acceptable(vaccination_and_masks)),
            by(rule("epidemic-policy.pl", clause(19))),
            bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001)]),
            uses([
              proof(
                goal(risk_score(vaccination_and_masks, 0.5005000000000001)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 0.65), binding("A", 0.77)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(vaccination_and_masks, 0.55)),
                    by(fact("epidemic-policy.pl", clause(9)))
                  ),
                  proof(
                    goal(mask_factor(vaccination_and_masks, 0.65)),
                    by(fact("epidemic-policy.pl", clause(13)))
                  ),
                  proof(
                    goal(is(0.77, *(1.4, 0.55))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.5005000000000001, *(0.77, 0.65))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(=<(0.5005000000000001, 0.75)),
                by(builtin(=<, 2))
              )
            ])
          ),
          proof(
            goal(status(no_mandate, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", no_mandate), binding("R", 1.4)]),
            uses([
              proof(
                goal(policy(no_mandate)),
                by(fact("epidemic-policy.pl", clause(1)))
              ),
              proof(
                goal(risk_score(no_mandate, 1.4)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", no_mandate), binding("R", 1.4), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 1.0), binding("A", 1.4)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(no_mandate, 1.0)),
                    by(fact("epidemic-policy.pl", clause(6)))
                  ),
                  proof(
                    goal(mask_factor(no_mandate, 1.0)),
                    by(fact("epidemic-policy.pl", clause(10)))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(1.4, 0.75)),
                by(builtin(>, 2))
              )
            ])
          ),
          proof(
            goal(status(vaccination_campaign, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", vaccination_campaign), binding("R", 0.77)]),
            uses([
              proof(
                goal(policy(vaccination_campaign)),
                by(fact("epidemic-policy.pl", clause(2)))
              ),
              proof(
                goal(risk_score(vaccination_campaign, 0.77)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", vaccination_campaign), binding("R", 0.77), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 1.0), binding("A", 0.77)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(vaccination_campaign, 0.55)),
                    by(fact("epidemic-policy.pl", clause(7)))
                  ),
                  proof(
                    goal(mask_factor(vaccination_campaign, 1.0)),
                    by(fact("epidemic-policy.pl", clause(11)))
                  ),
                  proof(
                    goal(is(0.77, *(1.4, 0.55))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.77, *(0.77, 1.0))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(0.77, 0.75)),
                by(builtin(>, 2))
              )
            ])
          ),
          proof(
            goal(status(indoor_masks, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999)]),
            uses([
              proof(
                goal(policy(indoor_masks)),
                by(fact("epidemic-policy.pl", clause(3)))
              ),
              proof(
                goal(risk_score(indoor_masks, 0.9099999999999999)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 0.65), binding("A", 1.4)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(indoor_masks, 1.0)),
                    by(fact("epidemic-policy.pl", clause(8)))
                  ),
                  proof(
                    goal(mask_factor(indoor_masks, 0.65)),
                    by(fact("epidemic-policy.pl", clause(12)))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.9099999999999999, *(1.4, 0.65))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(0.9099999999999999, 0.75)),
                by(builtin(>, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

reason(epidemic_policy, "combined vaccination and indoor masks are the only policy below the outbreak threshold").
why(
  reason(epidemic_policy, "combined vaccination and indoor masks are the only policy below the outbreak threshold"),
  proof(
    goal(reason(epidemic_policy, "combined vaccination and indoor masks are the only policy below the outbreak threshold")),
    by(rule("epidemic-policy.pl", clause(26))),
    uses([
      proof(
        goal(recommended(vaccination_and_masks)),
        by(rule("epidemic-policy.pl", clause(22))),
        uses([
          proof(
            goal(acceptable(vaccination_and_masks)),
            by(rule("epidemic-policy.pl", clause(19))),
            bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001)]),
            uses([
              proof(
                goal(risk_score(vaccination_and_masks, 0.5005000000000001)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", vaccination_and_masks), binding("R", 0.5005000000000001), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 0.65), binding("A", 0.77)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(vaccination_and_masks, 0.55)),
                    by(fact("epidemic-policy.pl", clause(9)))
                  ),
                  proof(
                    goal(mask_factor(vaccination_and_masks, 0.65)),
                    by(fact("epidemic-policy.pl", clause(13)))
                  ),
                  proof(
                    goal(is(0.77, *(1.4, 0.55))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.5005000000000001, *(0.77, 0.65))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(=<(0.5005000000000001, 0.75)),
                by(builtin(=<, 2))
              )
            ])
          ),
          proof(
            goal(status(no_mandate, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", no_mandate), binding("R", 1.4)]),
            uses([
              proof(
                goal(policy(no_mandate)),
                by(fact("epidemic-policy.pl", clause(1)))
              ),
              proof(
                goal(risk_score(no_mandate, 1.4)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", no_mandate), binding("R", 1.4), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 1.0), binding("A", 1.4)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(no_mandate, 1.0)),
                    by(fact("epidemic-policy.pl", clause(6)))
                  ),
                  proof(
                    goal(mask_factor(no_mandate, 1.0)),
                    by(fact("epidemic-policy.pl", clause(10)))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(1.4, 0.75)),
                by(builtin(>, 2))
              )
            ])
          ),
          proof(
            goal(status(vaccination_campaign, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", vaccination_campaign), binding("R", 0.77)]),
            uses([
              proof(
                goal(policy(vaccination_campaign)),
                by(fact("epidemic-policy.pl", clause(2)))
              ),
              proof(
                goal(risk_score(vaccination_campaign, 0.77)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", vaccination_campaign), binding("R", 0.77), binding("Base", 1.4), binding("Vf", 0.55), binding("Mf", 1.0), binding("A", 0.77)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(vaccination_campaign, 0.55)),
                    by(fact("epidemic-policy.pl", clause(7)))
                  ),
                  proof(
                    goal(mask_factor(vaccination_campaign, 1.0)),
                    by(fact("epidemic-policy.pl", clause(11)))
                  ),
                  proof(
                    goal(is(0.77, *(1.4, 0.55))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.77, *(0.77, 1.0))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(0.77, 0.75)),
                by(builtin(>, 2))
              )
            ])
          ),
          proof(
            goal(status(indoor_masks, insufficient_control)),
            by(rule("epidemic-policy.pl", clause(20))),
            bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999)]),
            uses([
              proof(
                goal(policy(indoor_masks)),
                by(fact("epidemic-policy.pl", clause(3)))
              ),
              proof(
                goal(risk_score(indoor_masks, 0.9099999999999999)),
                by(rule("epidemic-policy.pl", clause(18))),
                bindings([binding("P", indoor_masks), binding("R", 0.9099999999999999), binding("Base", 1.4), binding("Vf", 1.0), binding("Mf", 0.65), binding("A", 1.4)]),
                uses([
                  proof(
                    goal(base_risk(1.4)),
                    by(fact("epidemic-policy.pl", clause(5)))
                  ),
                  proof(
                    goal(vaccination_factor(indoor_masks, 1.0)),
                    by(fact("epidemic-policy.pl", clause(8)))
                  ),
                  proof(
                    goal(mask_factor(indoor_masks, 0.65)),
                    by(fact("epidemic-policy.pl", clause(12)))
                  ),
                  proof(
                    goal(is(1.4, *(1.4, 1.0))),
                    by(builtin(is, 2))
                  ),
                  proof(
                    goal(is(0.9099999999999999, *(1.4, 0.65))),
                    by(builtin(is, 2))
                  )
                ])
              ),
              proof(
                goal(>(0.9099999999999999, 0.75)),
                by(builtin(>, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

