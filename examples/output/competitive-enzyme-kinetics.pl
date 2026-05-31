effectiveKm_uM(assay1, 90.0).
why(
  effectiveKm_uM(assay1, 90.0),
  proof(
    goal(effectiveKm_uM(assay1, 90.0)),
    by(rule("competitive-enzyme-kinetics.pl", clause(19))),
    bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0)]),
    uses([
      proof(
        goal(effective_km(assay1, 90.0)),
        by(rule("competitive-enzyme-kinetics.pl", clause(14))),
        bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0), binding("Km", 30.0), binding("Multiplier", 3.0)]),
        uses([
          proof(
            goal(assay(assay1, km_uM, 30.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(9)))
          ),
          proof(
            goal(competitive_multiplier(assay1, 3.0)),
            by(rule("competitive-enzyme-kinetics.pl", clause(13))),
            bindings([binding("Assay", assay1), binding("Multiplier", 3.0), binding("Inhibitor", 10.0), binding("Ki", 5.0), binding("Ratio", 2.0)]),
            uses([
              proof(
                goal(assay(assay1, inhibitor_uM, 10.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(10)))
              ),
              proof(
                goal(assay(assay1, ki_uM, 5.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(11)))
              ),
              proof(
                goal(div(10.0, 5.0, 2.0)),
                by(builtin(div, 3))
              ),
              proof(
                goal(add(1.0, 2.0, 3.0)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(mul(30.0, 3.0, 90.0)),
            by(builtin(mul, 3))
          )
        ])
      )
    ])
  )
).

uninhibitedRate_uM_s(assay1, 75.0).
why(
  uninhibitedRate_uM_s(assay1, 75.0),
  proof(
    goal(uninhibitedRate_uM_s(assay1, 75.0)),
    by(rule("competitive-enzyme-kinetics.pl", clause(20))),
    bindings([binding("Assay", assay1), binding("Rate", 75.0)]),
    uses([
      proof(
        goal(uninhibited_rate(assay1, 75.0)),
        by(rule("competitive-enzyme-kinetics.pl", clause(15))),
        bindings([binding("Assay", assay1), binding("Rate", 75.0), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("Km", 30.0), binding("Numerator", 6000.0), binding("Denominator", 80.0)]),
        uses([
          proof(
            goal(assay(assay1, vmax_uM_s, 120.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(7)))
          ),
          proof(
            goal(assay(assay1, substrate_uM, 50.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(8)))
          ),
          proof(
            goal(assay(assay1, km_uM, 30.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(9)))
          ),
          proof(
            goal(mul(120.0, 50.0, 6000.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(30.0, 50.0, 80.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(6000.0, 80.0, 75.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

inhibitedRate_uM_s(assay1, 42.857142857142854).
why(
  inhibitedRate_uM_s(assay1, 42.857142857142854),
  proof(
    goal(inhibitedRate_uM_s(assay1, 42.857142857142854)),
    by(rule("competitive-enzyme-kinetics.pl", clause(21))),
    bindings([binding("Assay", assay1), binding("Rate", 42.857142857142854)]),
    uses([
      proof(
        goal(inhibited_rate(assay1, 42.857142857142854)),
        by(rule("competitive-enzyme-kinetics.pl", clause(16))),
        bindings([binding("Assay", assay1), binding("Rate", 42.857142857142854), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("EffectiveKm", 90.0), binding("Numerator", 6000.0), binding("Denominator", 140.0)]),
        uses([
          proof(
            goal(assay(assay1, vmax_uM_s, 120.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(7)))
          ),
          proof(
            goal(assay(assay1, substrate_uM, 50.0)),
            by(fact("competitive-enzyme-kinetics.pl", clause(8)))
          ),
          proof(
            goal(effective_km(assay1, 90.0)),
            by(rule("competitive-enzyme-kinetics.pl", clause(14))),
            bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0), binding("Km", 30.0), binding("Multiplier", 3.0)]),
            uses([
              proof(
                goal(assay(assay1, km_uM, 30.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(9)))
              ),
              proof(
                goal(competitive_multiplier(assay1, 3.0)),
                by(rule("competitive-enzyme-kinetics.pl", clause(13))),
                bindings([binding("Assay", assay1), binding("Multiplier", 3.0), binding("Inhibitor", 10.0), binding("Ki", 5.0), binding("Ratio", 2.0)]),
                uses([
                  proof(
                    goal(assay(assay1, inhibitor_uM, 10.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(10)))
                  ),
                  proof(
                    goal(assay(assay1, ki_uM, 5.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(11)))
                  ),
                  proof(
                    goal(div(10.0, 5.0, 2.0)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(1.0, 2.0, 3.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(mul(30.0, 3.0, 90.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(120.0, 50.0, 6000.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(90.0, 50.0, 140.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(6000.0, 140.0, 42.857142857142854)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

inhibitionFraction(assay1, 0.4285714285714286).
why(
  inhibitionFraction(assay1, 0.4285714285714286),
  proof(
    goal(inhibitionFraction(assay1, 0.4285714285714286)),
    by(rule("competitive-enzyme-kinetics.pl", clause(22))),
    bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286)]),
    uses([
      proof(
        goal(inhibition_fraction(assay1, 0.4285714285714286)),
        by(rule("competitive-enzyme-kinetics.pl", clause(17))),
        bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286), binding("Uninhibited", 75.0), binding("Inhibited", 42.857142857142854), binding("Delta", 32.142857142857146)]),
        uses([
          proof(
            goal(uninhibited_rate(assay1, 75.0)),
            by(rule("competitive-enzyme-kinetics.pl", clause(15))),
            bindings([binding("Assay", assay1), binding("Rate", 75.0), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("Km", 30.0), binding("Numerator", 6000.0), binding("Denominator", 80.0)]),
            uses([
              proof(
                goal(assay(assay1, vmax_uM_s, 120.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(7)))
              ),
              proof(
                goal(assay(assay1, substrate_uM, 50.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(8)))
              ),
              proof(
                goal(assay(assay1, km_uM, 30.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(9)))
              ),
              proof(
                goal(mul(120.0, 50.0, 6000.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(30.0, 50.0, 80.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(div(6000.0, 80.0, 75.0)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(inhibited_rate(assay1, 42.857142857142854)),
            by(rule("competitive-enzyme-kinetics.pl", clause(16))),
            bindings([binding("Assay", assay1), binding("Rate", 42.857142857142854), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("EffectiveKm", 90.0), binding("Numerator", 6000.0), binding("Denominator", 140.0)]),
            uses([
              proof(
                goal(assay(assay1, vmax_uM_s, 120.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(7)))
              ),
              proof(
                goal(assay(assay1, substrate_uM, 50.0)),
                by(fact("competitive-enzyme-kinetics.pl", clause(8)))
              ),
              proof(
                goal(effective_km(assay1, 90.0)),
                by(rule("competitive-enzyme-kinetics.pl", clause(14))),
                bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0), binding("Km", 30.0), binding("Multiplier", 3.0)]),
                uses([
                  proof(
                    goal(assay(assay1, km_uM, 30.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(9)))
                  ),
                  proof(
                    goal(competitive_multiplier(assay1, 3.0)),
                    by(rule("competitive-enzyme-kinetics.pl", clause(13))),
                    bindings([binding("Assay", assay1), binding("Multiplier", 3.0), binding("Inhibitor", 10.0), binding("Ki", 5.0), binding("Ratio", 2.0)]),
                    uses([
                      proof(
                        goal(assay(assay1, inhibitor_uM, 10.0)),
                        by(fact("competitive-enzyme-kinetics.pl", clause(10)))
                      ),
                      proof(
                        goal(assay(assay1, ki_uM, 5.0)),
                        by(fact("competitive-enzyme-kinetics.pl", clause(11)))
                      ),
                      proof(
                        goal(div(10.0, 5.0, 2.0)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(1.0, 2.0, 3.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(30.0, 3.0, 90.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(120.0, 50.0, 6000.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(90.0, 50.0, 140.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(div(6000.0, 140.0, 42.857142857142854)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(sub(75.0, 42.857142857142854, 32.142857142857146)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(32.142857142857146, 75.0, 0.4285714285714286)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

status(assay1, significant_inhibition).
why(
  status(assay1, significant_inhibition),
  proof(
    goal(status(assay1, significant_inhibition)),
    by(rule("competitive-enzyme-kinetics.pl", clause(23))),
    bindings([binding("Assay", assay1)]),
    uses([
      proof(
        goal(significant_inhibition(assay1)),
        by(rule("competitive-enzyme-kinetics.pl", clause(18))),
        bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286), binding("Limit", 0.25)]),
        uses([
          proof(
            goal(inhibition_fraction(assay1, 0.4285714285714286)),
            by(rule("competitive-enzyme-kinetics.pl", clause(17))),
            bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286), binding("Uninhibited", 75.0), binding("Inhibited", 42.857142857142854), binding("Delta", 32.142857142857146)]),
            uses([
              proof(
                goal(uninhibited_rate(assay1, 75.0)),
                by(rule("competitive-enzyme-kinetics.pl", clause(15))),
                bindings([binding("Assay", assay1), binding("Rate", 75.0), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("Km", 30.0), binding("Numerator", 6000.0), binding("Denominator", 80.0)]),
                uses([
                  proof(
                    goal(assay(assay1, vmax_uM_s, 120.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(7)))
                  ),
                  proof(
                    goal(assay(assay1, substrate_uM, 50.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(8)))
                  ),
                  proof(
                    goal(assay(assay1, km_uM, 30.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(9)))
                  ),
                  proof(
                    goal(mul(120.0, 50.0, 6000.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(30.0, 50.0, 80.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(div(6000.0, 80.0, 75.0)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(inhibited_rate(assay1, 42.857142857142854)),
                by(rule("competitive-enzyme-kinetics.pl", clause(16))),
                bindings([binding("Assay", assay1), binding("Rate", 42.857142857142854), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("EffectiveKm", 90.0), binding("Numerator", 6000.0), binding("Denominator", 140.0)]),
                uses([
                  proof(
                    goal(assay(assay1, vmax_uM_s, 120.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(7)))
                  ),
                  proof(
                    goal(assay(assay1, substrate_uM, 50.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(8)))
                  ),
                  proof(
                    goal(effective_km(assay1, 90.0)),
                    by(rule("competitive-enzyme-kinetics.pl", clause(14))),
                    bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0), binding("Km", 30.0), binding("Multiplier", 3.0)]),
                    uses([
                      proof(
                        goal(assay(assay1, km_uM, 30.0)),
                        by(fact("competitive-enzyme-kinetics.pl", clause(9)))
                      ),
                      proof(
                        goal(competitive_multiplier(assay1, 3.0)),
                        by(rule("competitive-enzyme-kinetics.pl", clause(13))),
                        bindings([binding("Assay", assay1), binding("Multiplier", 3.0), binding("Inhibitor", 10.0), binding("Ki", 5.0), binding("Ratio", 2.0)]),
                        uses([
                          proof(
                            goal(assay(assay1, inhibitor_uM, 10.0)),
                            by(fact("competitive-enzyme-kinetics.pl", clause(10)))
                          ),
                          proof(
                            goal(assay(assay1, ki_uM, 5.0)),
                            by(fact("competitive-enzyme-kinetics.pl", clause(11)))
                          ),
                          proof(
                            goal(div(10.0, 5.0, 2.0)),
                            by(builtin(div, 3))
                          ),
                          proof(
                            goal(add(1.0, 2.0, 3.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(30.0, 3.0, 90.0)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(120.0, 50.0, 6000.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(90.0, 50.0, 140.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(div(6000.0, 140.0, 42.857142857142854)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(sub(75.0, 42.857142857142854, 32.142857142857146)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(div(32.142857142857146, 75.0, 0.4285714285714286)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(threshold(assay1, significant_inhibition_fraction, 0.25)),
            by(fact("competitive-enzyme-kinetics.pl", clause(12)))
          ),
          proof(
            goal(gt(0.4285714285714286, 0.25)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

reason(assay1, "competitive inhibitor raises effective Km and lowers reaction rate").
why(
  reason(assay1, "competitive inhibitor raises effective Km and lowers reaction rate"),
  proof(
    goal(reason(assay1, "competitive inhibitor raises effective Km and lowers reaction rate")),
    by(rule("competitive-enzyme-kinetics.pl", clause(24))),
    bindings([binding("Assay", assay1)]),
    uses([
      proof(
        goal(significant_inhibition(assay1)),
        by(rule("competitive-enzyme-kinetics.pl", clause(18))),
        bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286), binding("Limit", 0.25)]),
        uses([
          proof(
            goal(inhibition_fraction(assay1, 0.4285714285714286)),
            by(rule("competitive-enzyme-kinetics.pl", clause(17))),
            bindings([binding("Assay", assay1), binding("Fraction", 0.4285714285714286), binding("Uninhibited", 75.0), binding("Inhibited", 42.857142857142854), binding("Delta", 32.142857142857146)]),
            uses([
              proof(
                goal(uninhibited_rate(assay1, 75.0)),
                by(rule("competitive-enzyme-kinetics.pl", clause(15))),
                bindings([binding("Assay", assay1), binding("Rate", 75.0), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("Km", 30.0), binding("Numerator", 6000.0), binding("Denominator", 80.0)]),
                uses([
                  proof(
                    goal(assay(assay1, vmax_uM_s, 120.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(7)))
                  ),
                  proof(
                    goal(assay(assay1, substrate_uM, 50.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(8)))
                  ),
                  proof(
                    goal(assay(assay1, km_uM, 30.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(9)))
                  ),
                  proof(
                    goal(mul(120.0, 50.0, 6000.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(30.0, 50.0, 80.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(div(6000.0, 80.0, 75.0)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(inhibited_rate(assay1, 42.857142857142854)),
                by(rule("competitive-enzyme-kinetics.pl", clause(16))),
                bindings([binding("Assay", assay1), binding("Rate", 42.857142857142854), binding("Vmax", 120.0), binding("Substrate", 50.0), binding("EffectiveKm", 90.0), binding("Numerator", 6000.0), binding("Denominator", 140.0)]),
                uses([
                  proof(
                    goal(assay(assay1, vmax_uM_s, 120.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(7)))
                  ),
                  proof(
                    goal(assay(assay1, substrate_uM, 50.0)),
                    by(fact("competitive-enzyme-kinetics.pl", clause(8)))
                  ),
                  proof(
                    goal(effective_km(assay1, 90.0)),
                    by(rule("competitive-enzyme-kinetics.pl", clause(14))),
                    bindings([binding("Assay", assay1), binding("EffectiveKm", 90.0), binding("Km", 30.0), binding("Multiplier", 3.0)]),
                    uses([
                      proof(
                        goal(assay(assay1, km_uM, 30.0)),
                        by(fact("competitive-enzyme-kinetics.pl", clause(9)))
                      ),
                      proof(
                        goal(competitive_multiplier(assay1, 3.0)),
                        by(rule("competitive-enzyme-kinetics.pl", clause(13))),
                        bindings([binding("Assay", assay1), binding("Multiplier", 3.0), binding("Inhibitor", 10.0), binding("Ki", 5.0), binding("Ratio", 2.0)]),
                        uses([
                          proof(
                            goal(assay(assay1, inhibitor_uM, 10.0)),
                            by(fact("competitive-enzyme-kinetics.pl", clause(10)))
                          ),
                          proof(
                            goal(assay(assay1, ki_uM, 5.0)),
                            by(fact("competitive-enzyme-kinetics.pl", clause(11)))
                          ),
                          proof(
                            goal(div(10.0, 5.0, 2.0)),
                            by(builtin(div, 3))
                          ),
                          proof(
                            goal(add(1.0, 2.0, 3.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(30.0, 3.0, 90.0)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(120.0, 50.0, 6000.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(90.0, 50.0, 140.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(div(6000.0, 140.0, 42.857142857142854)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(sub(75.0, 42.857142857142854, 32.142857142857146)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(div(32.142857142857146, 75.0, 0.4285714285714286)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(threshold(assay1, significant_inhibition_fraction, 0.25)),
            by(fact("competitive-enzyme-kinetics.pl", clause(12)))
          ),
          proof(
            goal(gt(0.4285714285714286, 0.25)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

