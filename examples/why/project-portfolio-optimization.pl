bestPortfolio(portfolio2026, result(137, 75, 28, [solar, hvac, training, quality, recycling, cloud, security])).
why(
  bestPortfolio(portfolio2026, result(137, 75, 28, [solar, hvac, training, quality, recycling, cloud, security])),
  proof(
    goal(bestPortfolio(portfolio2026, result(137, 75, 28, [solar, hvac, training, quality, recycling, cloud, security]))), by(rule("project-portfolio-optimization.pl", clause(19))),
    bindings([binding("Value", 137), binding("Cost", 75), binding("Risk", 28), binding("Selected", [solar, hvac, training, quality, recycling, cloud, security]), binding("_Key", [137, -75, -28, [solar, hvac, training, quality, recycling, cloud, security]])]),
    uses([
      proof(goal(aggregate_max([137, NegCost, NegRisk, [solar, hvac, training, quality, recycling, cloud, security]], result(137, 75, 28, [solar, hvac, training, quality, recycling, cloud, security]), scoredPortfolio([solar, hvac, training, quality, recycling, cloud, security], 137, 75, 28, NegCost, NegRisk), [137, -75, -28, [solar, hvac, training, quality, recycling, cloud, security]], result(137, 75, 28, [solar, hvac, training, quality, recycling, cloud, security]))), by(builtin(aggregate_max, 5)))
    ])
  )
).

lowRiskTarget(portfolio2026, result(126, 74, 23, [solar, battery, hvac, training, quality, cloud])).
why(
  lowRiskTarget(portfolio2026, result(126, 74, 23, [solar, battery, hvac, training, quality, cloud])),
  proof(
    goal(lowRiskTarget(portfolio2026, result(126, 74, 23, [solar, battery, hvac, training, quality, cloud]))), by(rule("project-portfolio-optimization.pl", clause(20))),
    bindings([binding("Value", 126), binding("Cost", 74), binding("Risk", 23), binding("Selected", [solar, battery, hvac, training, quality, cloud]), binding("Target", 125), binding("_Key", [23, 74, [solar, battery, hvac, training, quality, cloud]])]),
    uses([
      proof(goal(targetValue(portfolio2026, 125)), by(fact("project-portfolio-optimization.pl", clause(9)))),
      proof(goal(aggregate_min([23, 74, [solar, battery, hvac, training, quality, cloud]], result(126, 74, 23, [solar, battery, hvac, training, quality, cloud]), targetPortfolio(125, [solar, battery, hvac, training, quality, cloud], 126, 74, 23), [23, 74, [solar, battery, hvac, training, quality, cloud]], result(126, 74, 23, [solar, battery, hvac, training, quality, cloud]))), by(builtin(aggregate_min, 5)))
    ])
  )
).

feasibleCount(portfolio2026, 1390).
why(
  feasibleCount(portfolio2026, 1390),
  proof(
    goal(feasibleCount(portfolio2026, 1390)), by(rule("project-portfolio-optimization.pl", clause(21))),
    bindings([binding("Count", 1390)]),
    uses([
      proof(goal(countall(feasiblePortfolio(_Selected, _Value, _Cost, _Risk), 1390)), by(builtin(countall, 2)))
    ])
  )
).

projectCount(portfolio2026, 12).
why(
  projectCount(portfolio2026, 12),
  proof(
    goal(projectCount(portfolio2026, 12)), by(rule("project-portfolio-optimization.pl", clause(22))),
    bindings([binding("Count", 12)]),
    uses([
      proof(goal(countall(project(_Name, _Value, _Cost, _Risk), 12)), by(builtin(countall, 2)))
    ])
  )
).

totalAvailableValue(portfolio2026, 268).
why(
  totalAvailableValue(portfolio2026, 268),
  proof(
    goal(totalAvailableValue(portfolio2026, 268)), by(rule("project-portfolio-optimization.pl", clause(23))),
    bindings([binding("Total", 268)]),
    uses([
      proof(goal(sumall(Value, project(_Name, Value, _Cost, _Risk), 268)), by(builtin(sumall, 3)))
    ])
  )
).

note(portfolio2026, "aggregate builtins combine with pruning and memoization to avoid sorted candidate bags").
why(
  note(portfolio2026, "aggregate builtins combine with pruning and memoization to avoid sorted candidate bags"),
  proof(
    goal(note(portfolio2026, "aggregate builtins combine with pruning and memoization to avoid sorted candidate bags")), by(rule("project-portfolio-optimization.pl", clause(24))),
    uses([
      proof(goal(eq(ok, ok)), by(builtin(eq, 2)))
    ])
  )
).

