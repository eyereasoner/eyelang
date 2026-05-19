triple(:CatEnablesDogRule, :derivedRule, rule(graph([triple(var(:y), rdf:type, :Dog)]), graph([triple(:test, :is, true)]))).
triple(:derivedRuleDemo, :status, :fired).
triple(:test, :is, true).
