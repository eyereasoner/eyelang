caseName(case, "delfour").
why(
  caseName(case, "delfour"),
  proof(
    goal(caseName(case, "delfour")), by(rule("delfour.pl", clause(97))),
    bindings([binding("Name", "delfour")]),
    uses([
      proof(
        goal(case_name(case, "delfour")), by(rule("delfour.pl", clause(37))),
        bindings([binding("Name", "delfour")]),
        uses([
          proof(
            goal(case_statement(case, caseName, "delfour")), by(rule("delfour.pl", clause(32))),
            bindings([binding("S", case), binding("P", caseName), binding("O", "delfour"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
            uses([
              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, caseName, "delfour")), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

needsLowSugar(case, true).
why(
  needsLowSugar(case, true),
  proof(
    goal(needsLowSugar(case, true)), by(rule("delfour.pl", clause(98))),
    uses([
      proof(
        goal(needs_low_sugar(case)), by(rule("delfour.pl", clause(78))),
        uses([
          proof(
            goal(condition(householdProfile, "Diabetes")), by(rule("delfour.pl", clause(46))),
            bindings([binding("Condition", "Diabetes")]),
            uses([
              proof(
                goal(case_statement(householdProfile, condition, "Diabetes")), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", householdProfile), binding("P", condition), binding("O", "Diabetes"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), householdProfile, condition, "Diabetes")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

derivedFromNeed(insight, "low_sugar").
why(
  derivedFromNeed(insight, "low_sugar"),
  proof(
    goal(derivedFromNeed(insight, "low_sugar")), by(rule("delfour.pl", clause(99))),
    bindings([binding("Need", "low_sugar")]),
    uses([
      proof(
        goal(derived_from_need(insight, "low_sugar")), by(rule("delfour.pl", clause(79))),
        uses([
          proof(
            goal(needs_low_sugar(case)), by(rule("delfour.pl", clause(78))),
            uses([
              proof(
                goal(condition(householdProfile, "Diabetes")), by(rule("delfour.pl", clause(46))),
                bindings([binding("Condition", "Diabetes")]),
                uses([
                  proof(
                    goal(case_statement(householdProfile, condition, "Diabetes")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", householdProfile), binding("P", condition), binding("O", "Diabetes"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), householdProfile, condition, "Diabetes")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

outcome(decision, "Allowed").
why(
  outcome(decision, "Allowed"),
  proof(
    goal(outcome(decision, "Allowed")), by(rule("delfour.pl", clause(100))),
    bindings([binding("Outcome", "Allowed"), binding("_Target", insight)]),
    uses([
      proof(
        goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
        uses([
          proof(
            goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
            bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                    bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                    uses([
                      proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                      proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                bindings([binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                uses([
                  proof(
                    goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
            ])
          )
        ])
      )
    ])
  )
).

target(decision, insight).
why(
  target(decision, insight),
  proof(
    goal(target(decision, insight)), by(rule("delfour.pl", clause(101))),
    bindings([binding("Target", insight), binding("_Outcome", "Allowed")]),
    uses([
      proof(
        goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
        uses([
          proof(
            goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
            bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                    bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                    uses([
                      proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                      proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                bindings([binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                uses([
                  proof(
                    goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
            ])
          )
        ])
      )
    ])
  )
).

scannedProduct(scan, "Classic Tea Biscuits").
why(
  scannedProduct(scan, "Classic Tea Biscuits"),
  proof(
    goal(scannedProduct(scan, "Classic Tea Biscuits")), by(rule("delfour.pl", clause(102))),
    bindings([binding("ProductName", "Classic Tea Biscuits"), binding("Product", prod_BIS_001)]),
    uses([
      proof(
        goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
        bindings([binding("Product", prod_BIS_001)]),
        uses([
          proof(
            goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
            bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
            uses([
              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      ),
      proof(
        goal(product_name(prod_BIS_001, "Classic Tea Biscuits")), by(rule("delfour.pl", clause(50))),
        bindings([binding("Product", prod_BIS_001), binding("Name", "Classic Tea Biscuits"), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_SugarTenths", 120), binding("_SugarG", 12.0)]),
        uses([
          proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
          proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
        ])
      )
    ])
  )
).

suggestedAlternative(case, prod_BIS_101).
why(
  suggestedAlternative(case, prod_BIS_101),
  proof(
    goal(suggestedAlternative(case, prod_BIS_101)), by(rule("delfour.pl", clause(103))),
    bindings([binding("Alternative", prod_BIS_101)]),
    uses([
      proof(
        goal(suggested_alternative(case, prod_BIS_101)), by(rule("delfour.pl", clause(90))),
        bindings([binding("Candidate", prod_BIS_101), binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("CandidateSugar", 30)]),
        uses([
          proof(
            goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
            bindings([binding("Product", prod_BIS_001)]),
            uses([
              proof(
                goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(product(prod_BIS_101)), by(rule("delfour.pl", clause(48))),
            bindings([binding("Product", prod_BIS_101), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarTenths", 30), binding("_SugarG", 3.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
            bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(gt(120, 30)), by(builtin(gt, 2))),
          proof(goal(not(better_lower_sugar(120, 30))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

suggestedAlternative(banner, "Low-Sugar Tea Biscuits").
why(
  suggestedAlternative(banner, "Low-Sugar Tea Biscuits"),
  proof(
    goal(suggestedAlternative(banner, "Low-Sugar Tea Biscuits")), by(rule("delfour.pl", clause(106))),
    bindings([binding("Name", "Low-Sugar Tea Biscuits")]),
    uses([
      proof(
        goal(banner_suggested_alternative(banner, "Low-Sugar Tea Biscuits")), by(rule("delfour.pl", clause(91))),
        bindings([binding("Name", "Low-Sugar Tea Biscuits"), binding("Alternative", prod_BIS_101)]),
        uses([
          proof(
            goal(banner_note(banner, "High sugar")), by(rule("delfour.pl", clause(88))),
            uses([
              proof(
                goal(banner_flags_high_sugar(check)), by(rule("delfour.pl", clause(86))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Threshold", 10.0)]),
                uses([
                  proof(
                    goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
                    uses([
                      proof(
                        goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
                        bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
                        uses([
                          proof(
                            goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                            bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                            uses([
                              proof(
                                goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                                bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                                uses([
                                  proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                                  proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(
                            goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                            bindings([binding("Purpose", "shopping_assist")]),
                            uses([
                              proof(
                                goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                                bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                                uses([
                                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(
                            goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                            bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                            uses([
                              proof(
                                goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                                bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                                uses([
                                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(
                            goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                            bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                            uses([
                              proof(
                                goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                                bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                                uses([
                                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                    bindings([binding("Product", prod_BIS_001)]),
                    uses([
                      proof(
                        goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                        bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                        uses([
                          proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                          proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(sugar_per_serving(prod_BIS_001, 12.0)), by(rule("delfour.pl", clause(52))),
                    bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarTenths", 120)]),
                    uses([
                      proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                      proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                    ])
                  ),
                  proof(
                    goal(threshold_g(insight, 10.0)), by(rule("delfour.pl", clause(57))),
                    bindings([binding("Threshold", 10.0)]),
                    uses([
                      proof(
                        goal(insight_statement(insight, thresholdG, 10.0)), by(rule("delfour.pl", clause(33))),
                        bindings([binding("S", insight), binding("P", thresholdG), binding("O", 10.0), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                        uses([
                          proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                          proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, thresholdG, 10.0)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(ge(12.0, 10.0)), by(builtin(ge, 2)))
                ])
              )
            ])
          ),
          proof(
            goal(suggested_alternative(case, prod_BIS_101)), by(rule("delfour.pl", clause(90))),
            bindings([binding("Candidate", prod_BIS_101), binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("CandidateSugar", 30)]),
            uses([
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(product(prod_BIS_101)), by(rule("delfour.pl", clause(48))),
                bindings([binding("Product", prod_BIS_101), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarTenths", 30), binding("_SugarG", 3.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(gt(120, 30)), by(builtin(gt, 2))),
              proof(goal(not(better_lower_sugar(120, 30))), by(builtin(not, 1)))
            ])
          ),
          proof(
            goal(product_name(prod_BIS_101, "Low-Sugar Tea Biscuits")), by(rule("delfour.pl", clause(50))),
            bindings([binding("Product", prod_BIS_101), binding("Name", "Low-Sugar Tea Biscuits"), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_SugarTenths", 30), binding("_SugarG", 3.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          )
        ])
      )
    ])
  )
).

headline(banner, "Track sugar per serving while you scan").
why(
  headline(banner, "Track sugar per serving while you scan"),
  proof(
    goal(headline(banner, "Track sugar per serving while you scan")), by(rule("delfour.pl", clause(104))),
    bindings([binding("Headline", "Track sugar per serving while you scan")]),
    uses([
      proof(
        goal(banner_headline(banner, "Track sugar per serving while you scan")), by(rule("delfour.pl", clause(87))),
        uses([
          proof(
            goal(banner_flags_high_sugar(check)), by(rule("delfour.pl", clause(86))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Threshold", 10.0)]),
            uses([
              proof(
                goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
                uses([
                  proof(
                    goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
                    bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
                    uses([
                      proof(
                        goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                        bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                            bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                            uses([
                              proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                              proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                        bindings([binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                        bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                        uses([
                          proof(
                            goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                        bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                        uses([
                          proof(
                            goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                            bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                            uses([
                              proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                              proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_per_serving(prod_BIS_001, 12.0)), by(rule("delfour.pl", clause(52))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarTenths", 120)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(threshold_g(insight, 10.0)), by(rule("delfour.pl", clause(57))),
                bindings([binding("Threshold", 10.0)]),
                uses([
                  proof(
                    goal(insight_statement(insight, thresholdG, 10.0)), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", thresholdG), binding("O", 10.0), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, thresholdG, 10.0)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(ge(12.0, 10.0)), by(builtin(ge, 2)))
            ])
          )
        ])
      )
    ])
  )
).

note(banner, "High sugar").
why(
  note(banner, "High sugar"),
  proof(
    goal(note(banner, "High sugar")), by(rule("delfour.pl", clause(105))),
    bindings([binding("Note", "High sugar")]),
    uses([
      proof(
        goal(banner_note(banner, "High sugar")), by(rule("delfour.pl", clause(88))),
        uses([
          proof(
            goal(banner_flags_high_sugar(check)), by(rule("delfour.pl", clause(86))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Threshold", 10.0)]),
            uses([
              proof(
                goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
                uses([
                  proof(
                    goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
                    bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
                    uses([
                      proof(
                        goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                        bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                            bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                            uses([
                              proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                              proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                        bindings([binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                        bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                        uses([
                          proof(
                            goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                        bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                        uses([
                          proof(
                            goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                            bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                            uses([
                              proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                              proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_per_serving(prod_BIS_001, 12.0)), by(rule("delfour.pl", clause(52))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarTenths", 120)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(threshold_g(insight, 10.0)), by(rule("delfour.pl", clause(57))),
                bindings([binding("Threshold", 10.0)]),
                uses([
                  proof(
                    goal(insight_statement(insight, thresholdG, 10.0)), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", thresholdG), binding("O", 10.0), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, thresholdG, 10.0)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(ge(12.0, 10.0)), by(builtin(ge, 2)))
            ])
          )
        ])
      )
    ])
  )
).

value(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.").
why(
  value(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance."),
  proof(
    goal(value(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.")), by(rule("delfour.pl", clause(107))),
    bindings([binding("Text", "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.")]),
    uses([
      proof(goal(reason_text(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.")), by(fact("delfour.pl", clause(31))))
    ])
  )
).

alg(signature, "HMAC-SHA256").
why(
  alg(signature, "HMAC-SHA256"),
  proof(
    goal(alg(signature, "HMAC-SHA256")), by(rule("delfour.pl", clause(108))),
    bindings([binding("Alg", "HMAC-SHA256")]),
    uses([
      proof(
        goal(signature_alg(signature, "HMAC-SHA256")), by(rule("delfour.pl", clause(72))),
        bindings([binding("Alg", "HMAC-SHA256")]),
        uses([
          proof(
            goal(signature_statement(signature, alg, "HMAC-SHA256")), by(rule("delfour.pl", clause(36))),
            bindings([binding("S", signature), binding("P", alg), binding("O", "HMAC-SHA256"), binding("Formula", (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))]),
            uses([
              proof(goal(signature_graph(delfourSignatureGraph, (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))), by(fact("delfour.pl", clause(30)))),
              proof(goal(formula_binary((alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)), signature, alg, "HMAC-SHA256")), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

auditEntries(case, 1).
why(
  auditEntries(case, 1),
  proof(
    goal(auditEntries(case, 1)), by(rule("delfour.pl", clause(109))),
    bindings([binding("Count", 1)]),
    uses([
      proof(
        goal(audit_entries(case, 1)), by(rule("delfour.pl", clause(45))),
        bindings([binding("Count", 1)]),
        uses([
          proof(
            goal(case_statement(case, auditEntries, 1)), by(rule("delfour.pl", clause(32))),
            bindings([binding("S", case), binding("P", auditEntries), binding("O", 1), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
            uses([
              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, auditEntries, 1)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

filesWritten(case, 6).
why(
  filesWritten(case, 6),
  proof(
    goal(filesWritten(case, 6)), by(rule("delfour.pl", clause(110))),
    bindings([binding("Count", 6)]),
    uses([
      proof(
        goal(files_written(case, 6)), by(rule("delfour.pl", clause(44))),
        bindings([binding("Count", 6)]),
        uses([
          proof(
            goal(case_statement(case, filesWritten, 6)), by(rule("delfour.pl", clause(32))),
            bindings([binding("S", case), binding("P", filesWritten), binding("O", 6), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
            uses([
              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, filesWritten, 6)), by(builtin(formula_binary, 4)))
            ])
          )
        ])
      )
    ])
  )
).

allChecksPass(result, true).
why(
  allChecksPass(result, true),
  proof(
    goal(allChecksPass(result, true)), by(rule("delfour.pl", clause(111))),
    uses([
      proof(
        goal(all_checks_pass(result)), by(rule("delfour.pl", clause(96))),
        uses([
          proof(
            goal(signature_verifies(check)), by(rule("delfour.pl", clause(81))),
            uses([
              proof(
                goal(hmac_verification_mode(signature, trustedPrecomputedInput)), by(rule("delfour.pl", clause(77))),
                bindings([binding("Mode", trustedPrecomputedInput)]),
                uses([
                  proof(
                    goal(signature_statement(signature, hmacVerificationMode, trustedPrecomputedInput)), by(rule("delfour.pl", clause(36))),
                    bindings([binding("S", signature), binding("P", hmacVerificationMode), binding("O", trustedPrecomputedInput), binding("Formula", (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))]),
                    uses([
                      proof(goal(signature_graph(delfourSignatureGraph, (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))), by(fact("delfour.pl", clause(30)))),
                      proof(goal(formula_binary((alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)), signature, hmacVerificationMode, trustedPrecomputedInput)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(payload_hash_matches(check)), by(rule("delfour.pl", clause(80))),
            bindings([binding("Digest", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
            uses([
              proof(
                goal(envelope_hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(71))),
                bindings([binding("Hash", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
                uses([
                  proof(
                    goal(envelope_statement(envelope, hash, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(35))),
                    bindings([binding("S", envelope), binding("P", hash), binding("O", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), binding("Formula", (insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")))]),
                    uses([
                      proof(goal(envelope_graph(delfourEnvelopeGraph, (insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")))), by(fact("delfour.pl", clause(29)))),
                      proof(goal(formula_binary((insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), envelope, hash, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(payload_hash_sha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(75))),
                bindings([binding("Hash", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
                uses([
                  proof(
                    goal(signature_statement(signature, payloadHashSha256, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(36))),
                    bindings([binding("S", signature), binding("P", payloadHashSha256), binding("O", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), binding("Formula", (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))]),
                    uses([
                      proof(goal(signature_graph(delfourSignatureGraph, (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))), by(fact("delfour.pl", clause(30)))),
                      proof(goal(formula_binary((alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)), signature, payloadHashSha256, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(minimization_strips_sensitive_terms(check)), by(rule("delfour.pl", clause(82))),
            bindings([binding("Text", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")]),
            uses([
              proof(
                goal(serialized_lowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(rule("delfour.pl", clause(64))),
                bindings([binding("Text", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")]),
                uses([
                  proof(
                    goal(insight_statement(insight, serializedLowercase, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", serializedLowercase), binding("O", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, serializedLowercase, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(not_matches("createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner", "diabetes|medical")), by(builtin(not_matches, 2)))
            ])
          ),
          proof(
            goal(scope_complete(check)), by(rule("delfour.pl", clause(83))),
            bindings([binding("_Device", "self-scanner"), binding("_Event", "pick_up_scanner"), binding("_Expiry", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(scope_device(insight, "self-scanner")), by(rule("delfour.pl", clause(59))),
                bindings([binding("Device", "self-scanner")]),
                uses([
                  proof(
                    goal(insight_statement(insight, scopeDevice, "self-scanner")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", scopeDevice), binding("O", "self-scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, scopeDevice, "self-scanner")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scope_event(insight, "pick_up_scanner")), by(rule("delfour.pl", clause(60))),
                bindings([binding("Event", "pick_up_scanner")]),
                uses([
                  proof(
                    goal(insight_statement(insight, scopeEvent, "pick_up_scanner")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", scopeEvent), binding("O", "pick_up_scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, scopeEvent, "pick_up_scanner")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
            bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                    bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                    uses([
                      proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                      proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                bindings([binding("Purpose", "shopping_assist")]),
                uses([
                  proof(
                    goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                uses([
                  proof(
                    goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
            ])
          ),
          proof(
            goal(banner_flags_high_sugar(check)), by(rule("delfour.pl", clause(86))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Threshold", 10.0)]),
            uses([
              proof(
                goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
                uses([
                  proof(
                    goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
                    bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
                    uses([
                      proof(
                        goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                        bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                            bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                            uses([
                              proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                              proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                        bindings([binding("Purpose", "shopping_assist")]),
                        uses([
                          proof(
                            goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                        bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                        uses([
                          proof(
                            goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                            bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                            uses([
                              proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                              proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                        bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                        uses([
                          proof(
                            goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                            bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                            uses([
                              proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                              proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
                    ])
                  )
                ])
              ),
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_per_serving(prod_BIS_001, 12.0)), by(rule("delfour.pl", clause(52))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarTenths", 120)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(threshold_g(insight, 10.0)), by(rule("delfour.pl", clause(57))),
                bindings([binding("Threshold", 10.0)]),
                uses([
                  proof(
                    goal(insight_statement(insight, thresholdG, 10.0)), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", thresholdG), binding("O", 10.0), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, thresholdG, 10.0)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(ge(12.0, 10.0)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(alternative_is_lower_sugar(check)), by(rule("delfour.pl", clause(92))),
            bindings([binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("Alternative", prod_BIS_101), binding("AlternativeSugar", 30)]),
            uses([
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(suggested_alternative(case, prod_BIS_101)), by(rule("delfour.pl", clause(90))),
                bindings([binding("Candidate", prod_BIS_101), binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("CandidateSugar", 30)]),
                uses([
                  proof(
                    goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                    bindings([binding("Product", prod_BIS_001)]),
                    uses([
                      proof(
                        goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                        bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                        uses([
                          proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                          proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
                    bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
                    uses([
                      proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                      proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                    ])
                  ),
                  proof(
                    goal(product(prod_BIS_101)), by(rule("delfour.pl", clause(48))),
                    bindings([binding("Product", prod_BIS_101), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarTenths", 30), binding("_SugarG", 3.0)]),
                    uses([
                      proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                      proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                    ])
                  ),
                  proof(
                    goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
                    bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
                    uses([
                      proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                      proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                    ])
                  ),
                  proof(goal(gt(120, 30)), by(builtin(gt, 2))),
                  proof(goal(not(better_lower_sugar(120, 30))), by(builtin(not, 1)))
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(gt(120, 30)), by(builtin(gt, 2)))
            ])
          ),
          proof(
            goal(duty_timing_consistent(check)), by(rule("delfour.pl", clause(93))),
            bindings([binding("DutyAt", "2025-10-05T20:37:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(scanner_duty_at(case, "2025-10-05T20:37:48.907163+00:00")), by(rule("delfour.pl", clause(43))),
                bindings([binding("Time", "2025-10-05T20:37:48.907163+00:00")]),
                uses([
                  proof(
                    goal(case_statement(case, scannerDutyAt, "2025-10-05T20:37:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", scannerDutyAt), binding("O", "2025-10-05T20:37:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerDutyAt, "2025-10-05T20:37:48.907163+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                    bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                    uses([
                      proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                      proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(goal(le("2025-10-05T20:37:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
            ])
          ),
          proof(
            goal(marketing_prohibited(check)), by(rule("delfour.pl", clause(94))),
            uses([
              proof(
                goal(prohibition(policy, odrl_distribute, insight, "marketing")), by(rule("delfour.pl", clause(67))),
                bindings([binding("Action", odrl_distribute), binding("Target", insight), binding("Purpose", "marketing")]),
                uses([
                  proof(
                    goal(policy_statement(policy, odrl_prohibition, prohibition(odrl_distribute, insight, "marketing"))), by(rule("delfour.pl", clause(34))),
                    bindings([binding("S", policy), binding("P", odrl_prohibition), binding("O", prohibition(odrl_distribute, insight, "marketing")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                    uses([
                      proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                      proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_prohibition, prohibition(odrl_distribute, insight, "marketing"))), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(files_written_expected(check)), by(rule("delfour.pl", clause(95))),
            uses([
              proof(
                goal(files_written(case, 6)), by(rule("delfour.pl", clause(44))),
                bindings([binding("Count", 6)]),
                uses([
                  proof(
                    goal(case_statement(case, filesWritten, 6)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", case), binding("P", filesWritten), binding("O", 6), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, filesWritten, 6)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

signatureVerifies(check, true).
why(
  signatureVerifies(check, true),
  proof(
    goal(signatureVerifies(check, true)), by(rule("delfour.pl", clause(112))),
    uses([
      proof(
        goal(signature_verifies(check)), by(rule("delfour.pl", clause(81))),
        uses([
          proof(
            goal(hmac_verification_mode(signature, trustedPrecomputedInput)), by(rule("delfour.pl", clause(77))),
            bindings([binding("Mode", trustedPrecomputedInput)]),
            uses([
              proof(
                goal(signature_statement(signature, hmacVerificationMode, trustedPrecomputedInput)), by(rule("delfour.pl", clause(36))),
                bindings([binding("S", signature), binding("P", hmacVerificationMode), binding("O", trustedPrecomputedInput), binding("Formula", (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))]),
                uses([
                  proof(goal(signature_graph(delfourSignatureGraph, (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))), by(fact("delfour.pl", clause(30)))),
                  proof(goal(formula_binary((alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)), signature, hmacVerificationMode, trustedPrecomputedInput)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

payloadHashMatches(check, true).
why(
  payloadHashMatches(check, true),
  proof(
    goal(payloadHashMatches(check, true)), by(rule("delfour.pl", clause(113))),
    uses([
      proof(
        goal(payload_hash_matches(check)), by(rule("delfour.pl", clause(80))),
        bindings([binding("Digest", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
        uses([
          proof(
            goal(envelope_hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(71))),
            bindings([binding("Hash", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
            uses([
              proof(
                goal(envelope_statement(envelope, hash, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(35))),
                bindings([binding("S", envelope), binding("P", hash), binding("O", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), binding("Formula", (insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")))]),
                uses([
                  proof(goal(envelope_graph(delfourEnvelopeGraph, (insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")))), by(fact("delfour.pl", clause(29)))),
                  proof(goal(formula_binary((insight(envelope, delfourInsightGraph), policy(envelope, delfourPolicyGraph), hash(envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), envelope, hash, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(payload_hash_sha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(75))),
            bindings([binding("Hash", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")]),
            uses([
              proof(
                goal(signature_statement(signature, payloadHashSha256, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(rule("delfour.pl", clause(36))),
                bindings([binding("S", signature), binding("P", payloadHashSha256), binding("O", "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), binding("Formula", (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))]),
                uses([
                  proof(goal(signature_graph(delfourSignatureGraph, (alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)))), by(fact("delfour.pl", clause(30)))),
                  proof(goal(formula_binary((alg(signature, "HMAC-SHA256"), keyid(signature, "demo-shared-secret"), created(signature, "2025-10-05T20:33:48.907163+00:00"), payloadHashSha256(signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"), hmac(signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"), hmacVerificationMode(signature, trustedPrecomputedInput)), signature, payloadHashSha256, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

minimizationStripsSensitiveTerms(check, true).
why(
  minimizationStripsSensitiveTerms(check, true),
  proof(
    goal(minimizationStripsSensitiveTerms(check, true)), by(rule("delfour.pl", clause(114))),
    uses([
      proof(
        goal(minimization_strips_sensitive_terms(check)), by(rule("delfour.pl", clause(82))),
        bindings([binding("Text", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")]),
        uses([
          proof(
            goal(serialized_lowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(rule("delfour.pl", clause(64))),
            bindings([binding("Text", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")]),
            uses([
              proof(
                goal(insight_statement(insight, serializedLowercase, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", serializedLowercase), binding("O", "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, serializedLowercase, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(not_matches("createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner", "diabetes|medical")), by(builtin(not_matches, 2)))
        ])
      )
    ])
  )
).

scopeComplete(check, true).
why(
  scopeComplete(check, true),
  proof(
    goal(scopeComplete(check, true)), by(rule("delfour.pl", clause(115))),
    uses([
      proof(
        goal(scope_complete(check)), by(rule("delfour.pl", clause(83))),
        bindings([binding("_Device", "self-scanner"), binding("_Event", "pick_up_scanner"), binding("_Expiry", "2025-10-05T22:33:48.907185+00:00")]),
        uses([
          proof(
            goal(scope_device(insight, "self-scanner")), by(rule("delfour.pl", clause(59))),
            bindings([binding("Device", "self-scanner")]),
            uses([
              proof(
                goal(insight_statement(insight, scopeDevice, "self-scanner")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", scopeDevice), binding("O", "self-scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, scopeDevice, "self-scanner")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(scope_event(insight, "pick_up_scanner")), by(rule("delfour.pl", clause(60))),
            bindings([binding("Event", "pick_up_scanner")]),
            uses([
              proof(
                goal(insight_statement(insight, scopeEvent, "pick_up_scanner")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", scopeEvent), binding("O", "pick_up_scanner"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, scopeEvent, "pick_up_scanner")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
            bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

authorizationAllowed(check, true).
why(
  authorizationAllowed(check, true),
  proof(
    goal(authorizationAllowed(check, true)), by(rule("delfour.pl", clause(116))),
    uses([
      proof(
        goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
        bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
        uses([
          proof(
            goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
            bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
            uses([
              proof(
                goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                uses([
                  proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                  proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
            bindings([binding("Purpose", "shopping_assist")]),
            uses([
              proof(
                goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
            bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
            uses([
              proof(
                goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
            bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

bannerFlagsHighSugar(check, true).
why(
  bannerFlagsHighSugar(check, true),
  proof(
    goal(bannerFlagsHighSugar(check, true)), by(rule("delfour.pl", clause(117))),
    uses([
      proof(
        goal(banner_flags_high_sugar(check)), by(rule("delfour.pl", clause(86))),
        bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Threshold", 10.0)]),
        uses([
          proof(
            goal(decision(decision, "Allowed", insight)), by(rule("delfour.pl", clause(85))),
            uses([
              proof(
                goal(authorization_allowed(check)), by(rule("delfour.pl", clause(84))),
                bindings([binding("AuthAt", "2025-10-05T20:35:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
                uses([
                  proof(
                    goal(permission(policy, odrl_use, insight, "shopping_assist")), by(rule("delfour.pl", clause(66))),
                    bindings([binding("Action", odrl_use), binding("Target", insight), binding("Purpose", "shopping_assist")]),
                    uses([
                      proof(
                        goal(policy_statement(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(rule("delfour.pl", clause(34))),
                        bindings([binding("S", policy), binding("P", odrl_permission), binding("O", permission(odrl_use, insight, "shopping_assist")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                        uses([
                          proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                          proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_permission, permission(odrl_use, insight, "shopping_assist"))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(request_purpose(case, "shopping_assist")), by(rule("delfour.pl", clause(38))),
                    bindings([binding("Purpose", "shopping_assist")]),
                    uses([
                      proof(
                        goal(case_statement(case, requestPurpose, "shopping_assist")), by(rule("delfour.pl", clause(32))),
                        bindings([binding("S", case), binding("P", requestPurpose), binding("O", "shopping_assist"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                        uses([
                          proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                          proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, requestPurpose, "shopping_assist")), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(scanner_auth_at(case, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(42))),
                    bindings([binding("Time", "2025-10-05T20:35:48.907163+00:00")]),
                    uses([
                      proof(
                        goal(case_statement(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                        bindings([binding("S", case), binding("P", scannerAuthAt), binding("O", "2025-10-05T20:35:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                        uses([
                          proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                          proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00")), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
                    bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
                    uses([
                      proof(
                        goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                        bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                        uses([
                          proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                          proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(le("2025-10-05T20:35:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
                ])
              )
            ])
          ),
          proof(
            goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
            bindings([binding("Product", prod_BIS_001)]),
            uses([
              proof(
                goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(sugar_per_serving(prod_BIS_001, 12.0)), by(rule("delfour.pl", clause(52))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 12.0), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarTenths", 120)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(threshold_g(insight, 10.0)), by(rule("delfour.pl", clause(57))),
            bindings([binding("Threshold", 10.0)]),
            uses([
              proof(
                goal(insight_statement(insight, thresholdG, 10.0)), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", thresholdG), binding("O", 10.0), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, thresholdG, 10.0)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(ge(12.0, 10.0)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

alternativeIsLowerSugar(check, true).
why(
  alternativeIsLowerSugar(check, true),
  proof(
    goal(alternativeIsLowerSugar(check, true)), by(rule("delfour.pl", clause(118))),
    uses([
      proof(
        goal(alternative_is_lower_sugar(check)), by(rule("delfour.pl", clause(92))),
        bindings([binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("Alternative", prod_BIS_101), binding("AlternativeSugar", 30)]),
        uses([
          proof(
            goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
            bindings([binding("Product", prod_BIS_001)]),
            uses([
              proof(
                goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
            bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(
            goal(suggested_alternative(case, prod_BIS_101)), by(rule("delfour.pl", clause(90))),
            bindings([binding("Candidate", prod_BIS_101), binding("Scanned", prod_BIS_001), binding("ScannedSugar", 120), binding("CandidateSugar", 30)]),
            uses([
              proof(
                goal(scanned_product(scan, prod_BIS_001)), by(rule("delfour.pl", clause(47))),
                bindings([binding("Product", prod_BIS_001)]),
                uses([
                  proof(
                    goal(case_statement(scan, scannedProduct, prod_BIS_001)), by(rule("delfour.pl", clause(32))),
                    bindings([binding("S", scan), binding("P", scannedProduct), binding("O", prod_BIS_001), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                    uses([
                      proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                      proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), scan, scannedProduct, prod_BIS_001)), by(builtin(formula_binary, 4)))
                    ])
                  )
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_001, 120)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_001), binding("Sugar", 120), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_001"), binding("_Name", "Classic Tea Biscuits"), binding("_SugarG", 12.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(product(prod_BIS_101)), by(rule("delfour.pl", clause(48))),
                bindings([binding("Product", prod_BIS_101), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarTenths", 30), binding("_SugarG", 3.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(
                goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
                bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
                uses([
                  proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
                  proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
                ])
              ),
              proof(goal(gt(120, 30)), by(builtin(gt, 2))),
              proof(goal(not(better_lower_sugar(120, 30))), by(builtin(not, 1)))
            ])
          ),
          proof(
            goal(sugar_tenths(prod_BIS_101, 30)), by(rule("delfour.pl", clause(51))),
            bindings([binding("Product", prod_BIS_101), binding("Sugar", 30), binding("Products", [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)]), binding("_Id", "prod_BIS_101"), binding("_Name", "Low-Sugar Tea Biscuits"), binding("_SugarG", 3.0)]),
            uses([
              proof(goal(product_catalog(delfourCatalog, [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(fact("delfour.pl", clause(26)))),
              proof(goal(member(product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), [product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0), product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0), product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0), product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)])), by(builtin(member, 2)))
            ])
          ),
          proof(goal(gt(120, 30)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

dutyTimingConsistent(check, true).
why(
  dutyTimingConsistent(check, true),
  proof(
    goal(dutyTimingConsistent(check, true)), by(rule("delfour.pl", clause(119))),
    uses([
      proof(
        goal(duty_timing_consistent(check)), by(rule("delfour.pl", clause(93))),
        bindings([binding("DutyAt", "2025-10-05T20:37:48.907163+00:00"), binding("ExpiresAt", "2025-10-05T22:33:48.907185+00:00")]),
        uses([
          proof(
            goal(scanner_duty_at(case, "2025-10-05T20:37:48.907163+00:00")), by(rule("delfour.pl", clause(43))),
            bindings([binding("Time", "2025-10-05T20:37:48.907163+00:00")]),
            uses([
              proof(
                goal(case_statement(case, scannerDutyAt, "2025-10-05T20:37:48.907163+00:00")), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", case), binding("P", scannerDutyAt), binding("O", "2025-10-05T20:37:48.907163+00:00"), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, scannerDutyAt, "2025-10-05T20:37:48.907163+00:00")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(
            goal(expires_at(insight, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(63))),
            bindings([binding("Time", "2025-10-05T22:33:48.907185+00:00")]),
            uses([
              proof(
                goal(insight_statement(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(rule("delfour.pl", clause(33))),
                bindings([binding("S", insight), binding("P", expiresAt), binding("O", "2025-10-05T22:33:48.907185+00:00"), binding("Formula", (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))]),
                uses([
                  proof(goal(insight_graph(delfourInsightGraph, (metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")))), by(fact("delfour.pl", clause(27)))),
                  proof(goal(formula_binary((metric(insight, "sugar_g_per_serving"), thresholdTenths(insight, 100), thresholdDisplay(insight, "10.0"), thresholdG(insight, 10.0), suggestionPolicy(insight, "lower_metric_first_higher_price_ok"), scopeDevice(insight, "self-scanner"), scopeEvent(insight, "pick_up_scanner"), retailer(insight, "Delfour"), createdAt(insight, "2025-10-05T20:33:48.907163+00:00"), expiresAt(insight, "2025-10-05T22:33:48.907185+00:00"), serializedLowercase(insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")), insight, expiresAt, "2025-10-05T22:33:48.907185+00:00")), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          ),
          proof(goal(le("2025-10-05T20:37:48.907163+00:00", "2025-10-05T22:33:48.907185+00:00")), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

marketingProhibited(check, true).
why(
  marketingProhibited(check, true),
  proof(
    goal(marketingProhibited(check, true)), by(rule("delfour.pl", clause(120))),
    uses([
      proof(
        goal(marketing_prohibited(check)), by(rule("delfour.pl", clause(94))),
        uses([
          proof(
            goal(prohibition(policy, odrl_distribute, insight, "marketing")), by(rule("delfour.pl", clause(67))),
            bindings([binding("Action", odrl_distribute), binding("Target", insight), binding("Purpose", "marketing")]),
            uses([
              proof(
                goal(policy_statement(policy, odrl_prohibition, prohibition(odrl_distribute, insight, "marketing"))), by(rule("delfour.pl", clause(34))),
                bindings([binding("S", policy), binding("P", odrl_prohibition), binding("O", prohibition(odrl_distribute, insight, "marketing")), binding("Formula", (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))]),
                uses([
                  proof(goal(policy_graph(delfourPolicyGraph, (odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))))), by(fact("delfour.pl", clause(28)))),
                  proof(goal(formula_binary((odrl_permission(policy, permission(odrl_use, insight, "shopping_assist")), odrl_prohibition(policy, prohibition(odrl_distribute, insight, "marketing")), odrl_duty(policy, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))), policy, odrl_prohibition, prohibition(odrl_distribute, insight, "marketing"))), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

filesWrittenExpected(check, true).
why(
  filesWrittenExpected(check, true),
  proof(
    goal(filesWrittenExpected(check, true)), by(rule("delfour.pl", clause(121))),
    uses([
      proof(
        goal(files_written_expected(check)), by(rule("delfour.pl", clause(95))),
        uses([
          proof(
            goal(files_written(case, 6)), by(rule("delfour.pl", clause(44))),
            bindings([binding("Count", 6)]),
            uses([
              proof(
                goal(case_statement(case, filesWritten, 6)), by(rule("delfour.pl", clause(32))),
                bindings([binding("S", case), binding("P", filesWritten), binding("O", 6), binding("Formula", (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))]),
                uses([
                  proof(goal(case_graph(delfourCaseGraph, (caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)))), by(fact("delfour.pl", clause(25)))),
                  proof(goal(formula_binary((caseName(case, "delfour"), requestPurpose(case, "shopping_assist"), requestAction(case, odrl_use), phoneCreatedAt(case, "2025-10-05T20:33:48.907163+00:00"), phoneExpiresAt(case, "2025-10-05T22:33:48.907185+00:00"), scannerAuthAt(case, "2025-10-05T20:35:48.907163+00:00"), scannerDutyAt(case, "2025-10-05T20:37:48.907163+00:00"), filesWritten(case, 6), auditEntries(case, 1), condition(householdProfile, "Diabetes"), scannedProduct(scan, prod_BIS_001)), case, filesWritten, 6)), by(builtin(formula_binary, 4)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

