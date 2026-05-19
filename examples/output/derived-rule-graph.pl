triple(:CatEnablesDogRule, :derivedRule, rule(graph([statement(var(:y), rdf:type, :Dog)]), graph([statement(:test, :is, true)]))).
triple(:derivedRuleDemo, :status, :fired).
triple(:test, :is, true).
