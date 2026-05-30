impactedByFailureOf(checkout_api, payment_service).
why(
  impactedByFailureOf(checkout_api, payment_service),
  proof(
    goal(impactedByFailureOf(checkout_api, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(checkout_api, payment_service)), by(rule("service-impact.pl", clause(19))),
        bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
        uses([
          proof(goal(depends_on(checkout_api, payment_service)), by(fact("service-impact.pl", clause(6))))
        ])
      )
    ])
  )
).

impactedByFailureOf(risk_rules, payment_service).
why(
  impactedByFailureOf(risk_rules, payment_service),
  proof(
    goal(impactedByFailureOf(risk_rules, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(risk_rules, payment_service)), by(rule("service-impact.pl", clause(19))),
        bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
        uses([
          proof(goal(depends_on(risk_rules, payment_service)), by(fact("service-impact.pl", clause(10))))
        ])
      )
    ])
  )
).

impactedByFailureOf(web_store, payment_service).
why(
  impactedByFailureOf(web_store, payment_service),
  proof(
    goal(impactedByFailureOf(web_store, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", web_store), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(web_store, payment_service)), by(rule("service-impact.pl", clause(20))),
        bindings([binding("Service", web_store), binding("Failed", payment_service), binding("Dependency", checkout_api)]),
        uses([
          proof(goal(depends_on(web_store, checkout_api)), by(fact("service-impact.pl", clause(4)))),
          proof(
            goal(impacted(checkout_api, payment_service)), by(rule("service-impact.pl", clause(19))),
            bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
            uses([
              proof(goal(depends_on(checkout_api, payment_service)), by(fact("service-impact.pl", clause(6))))
            ])
          )
        ])
      )
    ])
  )
).

impactedByFailureOf(mobile_app, payment_service).
why(
  impactedByFailureOf(mobile_app, payment_service),
  proof(
    goal(impactedByFailureOf(mobile_app, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", mobile_app), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(mobile_app, payment_service)), by(rule("service-impact.pl", clause(20))),
        bindings([binding("Service", mobile_app), binding("Failed", payment_service), binding("Dependency", checkout_api)]),
        uses([
          proof(goal(depends_on(mobile_app, checkout_api)), by(fact("service-impact.pl", clause(5)))),
          proof(
            goal(impacted(checkout_api, payment_service)), by(rule("service-impact.pl", clause(19))),
            bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
            uses([
              proof(goal(depends_on(checkout_api, payment_service)), by(fact("service-impact.pl", clause(6))))
            ])
          )
        ])
      )
    ])
  )
).

impactedByFailureOf(payment_service, payment_service).
why(
  impactedByFailureOf(payment_service, payment_service),
  proof(
    goal(impactedByFailureOf(payment_service, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", payment_service), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(payment_service, payment_service)), by(rule("service-impact.pl", clause(20))),
        bindings([binding("Service", payment_service), binding("Failed", payment_service), binding("Dependency", fraud_service)]),
        uses([
          proof(goal(depends_on(payment_service, fraud_service)), by(fact("service-impact.pl", clause(8)))),
          proof(
            goal(impacted(fraud_service, payment_service)), by(rule("service-impact.pl", clause(20))),
            bindings([binding("Service", fraud_service), binding("Failed", payment_service), binding("Dependency", risk_rules)]),
            uses([
              proof(goal(depends_on(fraud_service, risk_rules)), by(fact("service-impact.pl", clause(9)))),
              proof(
                goal(impacted(risk_rules, payment_service)), by(rule("service-impact.pl", clause(19))),
                bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
                uses([
                  proof(goal(depends_on(risk_rules, payment_service)), by(fact("service-impact.pl", clause(10))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

impactedByFailureOf(fraud_service, payment_service).
why(
  impactedByFailureOf(fraud_service, payment_service),
  proof(
    goal(impactedByFailureOf(fraud_service, payment_service)), by(rule("service-impact.pl", clause(24))),
    bindings([binding("Service", fraud_service), binding("Failed", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
      proof(
        goal(impacted(fraud_service, payment_service)), by(rule("service-impact.pl", clause(20))),
        bindings([binding("Service", fraud_service), binding("Failed", payment_service), binding("Dependency", risk_rules)]),
        uses([
          proof(goal(depends_on(fraud_service, risk_rules)), by(fact("service-impact.pl", clause(9)))),
          proof(
            goal(impacted(risk_rules, payment_service)), by(rule("service-impact.pl", clause(19))),
            bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
            uses([
              proof(goal(depends_on(risk_rules, payment_service)), by(fact("service-impact.pl", clause(10))))
            ])
          )
        ])
      )
    ])
  )
).

status(payment_service, failed).
why(
  status(payment_service, failed),
  proof(
    goal(status(payment_service, failed)), by(rule("service-impact.pl", clause(25))),
    bindings([binding("Service", payment_service)]),
    uses([
      proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18))))
    ])
  )
).

businessFunctionAtRisk(place_order, true).
why(
  businessFunctionAtRisk(place_order, true),
  proof(
    goal(businessFunctionAtRisk(place_order, true)), by(rule("service-impact.pl", clause(26))),
    bindings([binding("Function", place_order)]),
    uses([
      proof(
        goal(affected_function(place_order)), by(rule("service-impact.pl", clause(23))),
        bindings([binding("Function", place_order), binding("Service", web_store)]),
        uses([
          proof(goal(business_function(place_order, web_store)), by(fact("service-impact.pl", clause(13)))),
          proof(
            goal(affected(web_store)), by(rule("service-impact.pl", clause(21))),
            bindings([binding("Service", web_store), binding("Failed", payment_service)]),
            uses([
              proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
              proof(
                goal(impacted(web_store, payment_service)), by(rule("service-impact.pl", clause(20))),
                bindings([binding("Service", web_store), binding("Failed", payment_service), binding("Dependency", checkout_api)]),
                uses([
                  proof(goal(depends_on(web_store, checkout_api)), by(fact("service-impact.pl", clause(4)))),
                  proof(
                    goal(impacted(checkout_api, payment_service)), by(rule("service-impact.pl", clause(19))),
                    bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
                    uses([
                      proof(goal(depends_on(checkout_api, payment_service)), by(fact("service-impact.pl", clause(6))))
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

businessFunctionAtRisk(mobile_checkout, true).
why(
  businessFunctionAtRisk(mobile_checkout, true),
  proof(
    goal(businessFunctionAtRisk(mobile_checkout, true)), by(rule("service-impact.pl", clause(26))),
    bindings([binding("Function", mobile_checkout)]),
    uses([
      proof(
        goal(affected_function(mobile_checkout)), by(rule("service-impact.pl", clause(23))),
        bindings([binding("Function", mobile_checkout), binding("Service", mobile_app)]),
        uses([
          proof(goal(business_function(mobile_checkout, mobile_app)), by(fact("service-impact.pl", clause(14)))),
          proof(
            goal(affected(mobile_app)), by(rule("service-impact.pl", clause(21))),
            bindings([binding("Service", mobile_app), binding("Failed", payment_service)]),
            uses([
              proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
              proof(
                goal(impacted(mobile_app, payment_service)), by(rule("service-impact.pl", clause(20))),
                bindings([binding("Service", mobile_app), binding("Failed", payment_service), binding("Dependency", checkout_api)]),
                uses([
                  proof(goal(depends_on(mobile_app, checkout_api)), by(fact("service-impact.pl", clause(5)))),
                  proof(
                    goal(impacted(checkout_api, payment_service)), by(rule("service-impact.pl", clause(19))),
                    bindings([binding("Service", checkout_api), binding("Failed", payment_service)]),
                    uses([
                      proof(goal(depends_on(checkout_api, payment_service)), by(fact("service-impact.pl", clause(6))))
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

businessFunctionAtRisk(collect_payment, true).
why(
  businessFunctionAtRisk(collect_payment, true),
  proof(
    goal(businessFunctionAtRisk(collect_payment, true)), by(rule("service-impact.pl", clause(26))),
    bindings([binding("Function", collect_payment)]),
    uses([
      proof(
        goal(affected_function(collect_payment)), by(rule("service-impact.pl", clause(23))),
        bindings([binding("Function", collect_payment), binding("Service", payment_service)]),
        uses([
          proof(goal(business_function(collect_payment, payment_service)), by(fact("service-impact.pl", clause(15)))),
          proof(
            goal(affected(payment_service)), by(rule("service-impact.pl", clause(21))),
            bindings([binding("Service", payment_service), binding("Failed", payment_service)]),
            uses([
              proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
              proof(
                goal(impacted(payment_service, payment_service)), by(rule("service-impact.pl", clause(20))),
                bindings([binding("Service", payment_service), binding("Failed", payment_service), binding("Dependency", fraud_service)]),
                uses([
                  proof(goal(depends_on(payment_service, fraud_service)), by(fact("service-impact.pl", clause(8)))),
                  proof(
                    goal(impacted(fraud_service, payment_service)), by(rule("service-impact.pl", clause(20))),
                    bindings([binding("Service", fraud_service), binding("Failed", payment_service), binding("Dependency", risk_rules)]),
                    uses([
                      proof(goal(depends_on(fraud_service, risk_rules)), by(fact("service-impact.pl", clause(9)))),
                      proof(
                        goal(impacted(risk_rules, payment_service)), by(rule("service-impact.pl", clause(19))),
                        bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
                        uses([
                          proof(goal(depends_on(risk_rules, payment_service)), by(fact("service-impact.pl", clause(10))))
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
    ])
  )
).

businessFunctionAtRisk(screen_fraud, true).
why(
  businessFunctionAtRisk(screen_fraud, true),
  proof(
    goal(businessFunctionAtRisk(screen_fraud, true)), by(rule("service-impact.pl", clause(26))),
    bindings([binding("Function", screen_fraud)]),
    uses([
      proof(
        goal(affected_function(screen_fraud)), by(rule("service-impact.pl", clause(23))),
        bindings([binding("Function", screen_fraud), binding("Service", fraud_service)]),
        uses([
          proof(goal(business_function(screen_fraud, fraud_service)), by(fact("service-impact.pl", clause(16)))),
          proof(
            goal(affected(fraud_service)), by(rule("service-impact.pl", clause(21))),
            bindings([binding("Service", fraud_service), binding("Failed", payment_service)]),
            uses([
              proof(goal(failed(payment_service)), by(fact("service-impact.pl", clause(18)))),
              proof(
                goal(impacted(fraud_service, payment_service)), by(rule("service-impact.pl", clause(20))),
                bindings([binding("Service", fraud_service), binding("Failed", payment_service), binding("Dependency", risk_rules)]),
                uses([
                  proof(goal(depends_on(fraud_service, risk_rules)), by(fact("service-impact.pl", clause(9)))),
                  proof(
                    goal(impacted(risk_rules, payment_service)), by(rule("service-impact.pl", clause(19))),
                    bindings([binding("Service", risk_rules), binding("Failed", payment_service)]),
                    uses([
                      proof(goal(depends_on(risk_rules, payment_service)), by(fact("service-impact.pl", clause(10))))
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

