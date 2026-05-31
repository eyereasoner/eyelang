status(low_input, under_supplied).
why(
  status(low_input, under_supplied),
  proof(
    goal(status(low_input, under_supplied)), by(rule("field-nitrogen-balance.pl", clause(19))),
    bindings([binding("F", low_input), binding("D", 51.5)]),
    uses([
      proof(
        goal(deficit_n(low_input, 51.5)), by(rule("field-nitrogen-balance.pl", clause(16))),
        bindings([binding("F", low_input), binding("Deficit", 51.5), binding("Avail", 58.5), binding("__anon11", 25), binding("__anon12", 40), binding("__anon13", 0.10), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", low_input), binding("Avail", 58.5), binding("Total", 65), binding("__anon2", 25), binding("__anon3", 40), binding("Loss", 0.10), binding("__anon4", 110), binding("Retained", 0.90000000000000002)]),
            uses([
              proof(
                goal(total_n(low_input, 65)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", low_input), binding("Total", 65), binding("Soil", 25), binding("Fert", 40), binding("__anon0", 0.10), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
                  proof(goal(add(25, 40, 65)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
              proof(goal(sub(1.0, 0.10, 0.90000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(65, 0.90000000000000002, 58.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
          proof(goal(lt(58.5, 110)), by(builtin(lt, 2))),
          proof(goal(sub(110, 58.5, 51.5)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(gt(51.5, 10.0)), by(builtin(gt, 2)))
    ])
  )
).

status(balanced_loam, balanced).
why(
  status(balanced_loam, balanced),
  proof(
    goal(status(balanced_loam, balanced)), by(rule("field-nitrogen-balance.pl", clause(20))),
    bindings([binding("F", balanced_loam), binding("D", 0.0), binding("S", 0.0)]),
    uses([
      proof(
        goal(deficit_n(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(17))),
        bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("__anon14", 45), binding("__anon15", 80), binding("__anon16", 0.12), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
            uses([
              proof(
                goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                  proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
              proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(ge(110.0, 110)), by(builtin(ge, 2)))
        ])
      ),
      proof(
        goal(surplus_n(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(15))),
        bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("__anon8", 45), binding("__anon9", 80), binding("__anon10", 0.12), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
            uses([
              proof(
                goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                  proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
              proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(le(110.0, 110)), by(builtin(le, 2)))
        ])
      ),
      proof(goal(le(0.0, 10.0)), by(builtin(le, 2))),
      proof(goal(le(0.0, 10.0)), by(builtin(le, 2)))
    ])
  )
).

status(sandy_high, over_supplied).
why(
  status(sandy_high, over_supplied),
  proof(
    goal(status(sandy_high, over_supplied)), by(rule("field-nitrogen-balance.pl", clause(21))),
    bindings([binding("F", sandy_high), binding("S", 12.0)]),
    uses([
      proof(
        goal(surplus_n(sandy_high, 12.0)), by(rule("field-nitrogen-balance.pl", clause(14))),
        bindings([binding("F", sandy_high), binding("Surplus", 12.0), binding("Avail", 117.0), binding("__anon5", 30), binding("__anon6", 150), binding("__anon7", 0.35), binding("Demand", 105)]),
        uses([
          proof(
            goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
            uses([
              proof(
                goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
                uses([
                  proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                  proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(gt(117.0, 105)), by(builtin(gt, 2))),
          proof(goal(sub(117.0, 105, 12.0)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(gt(12.0, 10.0)), by(builtin(gt, 2)))
    ])
  )
).

status(clay_surplus, over_supplied).
why(
  status(clay_surplus, over_supplied),
  proof(
    goal(status(clay_surplus, over_supplied)), by(rule("field-nitrogen-balance.pl", clause(21))),
    bindings([binding("F", clay_surplus), binding("S", 27.200000000000017)]),
    uses([
      proof(
        goal(surplus_n(clay_surplus, 27.200000000000017)), by(rule("field-nitrogen-balance.pl", clause(14))),
        bindings([binding("F", clay_surplus), binding("Surplus", 27.200000000000017), binding("Avail", 147.20000000000002), binding("__anon5", 70), binding("__anon6", 90), binding("__anon7", 0.08), binding("Demand", 120)]),
        uses([
          proof(
            goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
            uses([
              proof(
                goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
                uses([
                  proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                  proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
              proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(gt(147.20000000000002, 120)), by(builtin(gt, 2))),
          proof(goal(sub(147.20000000000002, 120, 27.200000000000017)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(gt(27.200000000000017, 10.0)), by(builtin(gt, 2)))
    ])
  )
).

availableN_kg_ha(low_input, 58.5).
why(
  availableN_kg_ha(low_input, 58.5),
  proof(
    goal(availableN_kg_ha(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(22))),
    bindings([binding("F", low_input), binding("A", 58.5)]),
    uses([
      proof(
        goal(available_n(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(13))),
        bindings([binding("F", low_input), binding("Avail", 58.5), binding("Total", 65), binding("__anon2", 25), binding("__anon3", 40), binding("Loss", 0.10), binding("__anon4", 110), binding("Retained", 0.90000000000000002)]),
        uses([
          proof(
            goal(total_n(low_input, 65)), by(rule("field-nitrogen-balance.pl", clause(12))),
            bindings([binding("F", low_input), binding("Total", 65), binding("Soil", 25), binding("Fert", 40), binding("__anon0", 0.10), binding("__anon1", 110)]),
            uses([
              proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
              proof(goal(add(25, 40, 65)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
          proof(goal(sub(1.0, 0.10, 0.90000000000000002)), by(builtin(sub, 3))),
          proof(goal(mul(65, 0.90000000000000002, 58.5)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

availableN_kg_ha(balanced_loam, 110.0).
why(
  availableN_kg_ha(balanced_loam, 110.0),
  proof(
    goal(availableN_kg_ha(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(22))),
    bindings([binding("F", balanced_loam), binding("A", 110.0)]),
    uses([
      proof(
        goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
        bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
        uses([
          proof(
            goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
            bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
            uses([
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
          proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

availableN_kg_ha(sandy_high, 117.0).
why(
  availableN_kg_ha(sandy_high, 117.0),
  proof(
    goal(availableN_kg_ha(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(22))),
    bindings([binding("F", sandy_high), binding("A", 117.0)]),
    uses([
      proof(
        goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
        bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
        uses([
          proof(
            goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
            bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
            uses([
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
          proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

availableN_kg_ha(clay_surplus, 147.20000000000002).
why(
  availableN_kg_ha(clay_surplus, 147.20000000000002),
  proof(
    goal(availableN_kg_ha(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(22))),
    bindings([binding("F", clay_surplus), binding("A", 147.20000000000002)]),
    uses([
      proof(
        goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
        bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
        uses([
          proof(
            goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
            bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
            uses([
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
          proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

deficitN_kg_ha(low_input, 51.5).
why(
  deficitN_kg_ha(low_input, 51.5),
  proof(
    goal(deficitN_kg_ha(low_input, 51.5)), by(rule("field-nitrogen-balance.pl", clause(23))),
    bindings([binding("F", low_input), binding("D", 51.5)]),
    uses([
      proof(
        goal(deficit_n(low_input, 51.5)), by(rule("field-nitrogen-balance.pl", clause(16))),
        bindings([binding("F", low_input), binding("Deficit", 51.5), binding("Avail", 58.5), binding("__anon11", 25), binding("__anon12", 40), binding("__anon13", 0.10), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", low_input), binding("Avail", 58.5), binding("Total", 65), binding("__anon2", 25), binding("__anon3", 40), binding("Loss", 0.10), binding("__anon4", 110), binding("Retained", 0.90000000000000002)]),
            uses([
              proof(
                goal(total_n(low_input, 65)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", low_input), binding("Total", 65), binding("Soil", 25), binding("Fert", 40), binding("__anon0", 0.10), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
                  proof(goal(add(25, 40, 65)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
              proof(goal(sub(1.0, 0.10, 0.90000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(65, 0.90000000000000002, 58.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
          proof(goal(lt(58.5, 110)), by(builtin(lt, 2))),
          proof(goal(sub(110, 58.5, 51.5)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

deficitN_kg_ha(balanced_loam, 0.0).
why(
  deficitN_kg_ha(balanced_loam, 0.0),
  proof(
    goal(deficitN_kg_ha(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(23))),
    bindings([binding("F", balanced_loam), binding("D", 0.0)]),
    uses([
      proof(
        goal(deficit_n(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(17))),
        bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("__anon14", 45), binding("__anon15", 80), binding("__anon16", 0.12), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
            uses([
              proof(
                goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                  proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
              proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(ge(110.0, 110)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

deficitN_kg_ha(sandy_high, 0.0).
why(
  deficitN_kg_ha(sandy_high, 0.0),
  proof(
    goal(deficitN_kg_ha(sandy_high, 0.0)), by(rule("field-nitrogen-balance.pl", clause(23))),
    bindings([binding("F", sandy_high), binding("D", 0.0)]),
    uses([
      proof(
        goal(deficit_n(sandy_high, 0.0)), by(rule("field-nitrogen-balance.pl", clause(17))),
        bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("__anon14", 30), binding("__anon15", 150), binding("__anon16", 0.35), binding("Demand", 105)]),
        uses([
          proof(
            goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
            uses([
              proof(
                goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
                uses([
                  proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                  proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(ge(117.0, 105)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

deficitN_kg_ha(clay_surplus, 0.0).
why(
  deficitN_kg_ha(clay_surplus, 0.0),
  proof(
    goal(deficitN_kg_ha(clay_surplus, 0.0)), by(rule("field-nitrogen-balance.pl", clause(23))),
    bindings([binding("F", clay_surplus), binding("D", 0.0)]),
    uses([
      proof(
        goal(deficit_n(clay_surplus, 0.0)), by(rule("field-nitrogen-balance.pl", clause(17))),
        bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("__anon14", 70), binding("__anon15", 90), binding("__anon16", 0.08), binding("Demand", 120)]),
        uses([
          proof(
            goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
            uses([
              proof(
                goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
                uses([
                  proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                  proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
              proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(ge(147.20000000000002, 120)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

surplusN_kg_ha(sandy_high, 12.0).
why(
  surplusN_kg_ha(sandy_high, 12.0),
  proof(
    goal(surplusN_kg_ha(sandy_high, 12.0)), by(rule("field-nitrogen-balance.pl", clause(24))),
    bindings([binding("F", sandy_high), binding("S", 12.0)]),
    uses([
      proof(
        goal(surplus_n(sandy_high, 12.0)), by(rule("field-nitrogen-balance.pl", clause(14))),
        bindings([binding("F", sandy_high), binding("Surplus", 12.0), binding("Avail", 117.0), binding("__anon5", 30), binding("__anon6", 150), binding("__anon7", 0.35), binding("Demand", 105)]),
        uses([
          proof(
            goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
            uses([
              proof(
                goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
                uses([
                  proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                  proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(gt(117.0, 105)), by(builtin(gt, 2))),
          proof(goal(sub(117.0, 105, 12.0)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

surplusN_kg_ha(clay_surplus, 27.200000000000017).
why(
  surplusN_kg_ha(clay_surplus, 27.200000000000017),
  proof(
    goal(surplusN_kg_ha(clay_surplus, 27.200000000000017)), by(rule("field-nitrogen-balance.pl", clause(24))),
    bindings([binding("F", clay_surplus), binding("S", 27.200000000000017)]),
    uses([
      proof(
        goal(surplus_n(clay_surplus, 27.200000000000017)), by(rule("field-nitrogen-balance.pl", clause(14))),
        bindings([binding("F", clay_surplus), binding("Surplus", 27.200000000000017), binding("Avail", 147.20000000000002), binding("__anon5", 70), binding("__anon6", 90), binding("__anon7", 0.08), binding("Demand", 120)]),
        uses([
          proof(
            goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
            uses([
              proof(
                goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
                uses([
                  proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                  proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
              proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(gt(147.20000000000002, 120)), by(builtin(gt, 2))),
          proof(goal(sub(147.20000000000002, 120, 27.200000000000017)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

surplusN_kg_ha(low_input, 0.0).
why(
  surplusN_kg_ha(low_input, 0.0),
  proof(
    goal(surplusN_kg_ha(low_input, 0.0)), by(rule("field-nitrogen-balance.pl", clause(24))),
    bindings([binding("F", low_input), binding("S", 0.0)]),
    uses([
      proof(
        goal(surplus_n(low_input, 0.0)), by(rule("field-nitrogen-balance.pl", clause(15))),
        bindings([binding("F", low_input), binding("Avail", 58.5), binding("__anon8", 25), binding("__anon9", 40), binding("__anon10", 0.10), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", low_input), binding("Avail", 58.5), binding("Total", 65), binding("__anon2", 25), binding("__anon3", 40), binding("Loss", 0.10), binding("__anon4", 110), binding("Retained", 0.90000000000000002)]),
            uses([
              proof(
                goal(total_n(low_input, 65)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", low_input), binding("Total", 65), binding("Soil", 25), binding("Fert", 40), binding("__anon0", 0.10), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
                  proof(goal(add(25, 40, 65)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
              proof(goal(sub(1.0, 0.10, 0.90000000000000002)), by(builtin(sub, 3))),
              proof(goal(mul(65, 0.90000000000000002, 58.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
          proof(goal(le(58.5, 110)), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

surplusN_kg_ha(balanced_loam, 0.0).
why(
  surplusN_kg_ha(balanced_loam, 0.0),
  proof(
    goal(surplusN_kg_ha(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(24))),
    bindings([binding("F", balanced_loam), binding("S", 0.0)]),
    uses([
      proof(
        goal(surplus_n(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(15))),
        bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("__anon8", 45), binding("__anon9", 80), binding("__anon10", 0.12), binding("Demand", 110)]),
        uses([
          proof(
            goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
            bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
            uses([
              proof(
                goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
                bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
                uses([
                  proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                  proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
              proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(le(110.0, 110)), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

leachingIndex(sandy_high, 4.1999999999999993).
why(
  leachingIndex(sandy_high, 4.1999999999999993),
  proof(
    goal(leachingIndex(sandy_high, 4.1999999999999993)), by(rule("field-nitrogen-balance.pl", clause(25))),
    bindings([binding("F", sandy_high), binding("I", 4.1999999999999993)]),
    uses([
      proof(
        goal(leaching_index(sandy_high, 4.1999999999999993)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", sandy_high), binding("Index", 4.1999999999999993), binding("Surplus", 12.0), binding("__anon17", 30), binding("__anon18", 150), binding("Loss", 0.35), binding("__anon19", 105)]),
        uses([
          proof(
            goal(surplus_n(sandy_high, 12.0)), by(rule("field-nitrogen-balance.pl", clause(14))),
            bindings([binding("F", sandy_high), binding("Surplus", 12.0), binding("Avail", 117.0), binding("__anon5", 30), binding("__anon6", 150), binding("__anon7", 0.35), binding("Demand", 105)]),
            uses([
              proof(
                goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
                uses([
                  proof(
                    goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
                    uses([
                      proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                      proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                  proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
                  proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(gt(117.0, 105)), by(builtin(gt, 2))),
              proof(goal(sub(117.0, 105, 12.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(mul(12.0, 0.35, 4.1999999999999993)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

leachingIndex(clay_surplus, 2.1760000000000015).
why(
  leachingIndex(clay_surplus, 2.1760000000000015),
  proof(
    goal(leachingIndex(clay_surplus, 2.1760000000000015)), by(rule("field-nitrogen-balance.pl", clause(25))),
    bindings([binding("F", clay_surplus), binding("I", 2.1760000000000015)]),
    uses([
      proof(
        goal(leaching_index(clay_surplus, 2.1760000000000015)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", clay_surplus), binding("Index", 2.1760000000000015), binding("Surplus", 27.200000000000017), binding("__anon17", 70), binding("__anon18", 90), binding("Loss", 0.08), binding("__anon19", 120)]),
        uses([
          proof(
            goal(surplus_n(clay_surplus, 27.200000000000017)), by(rule("field-nitrogen-balance.pl", clause(14))),
            bindings([binding("F", clay_surplus), binding("Surplus", 27.200000000000017), binding("Avail", 147.20000000000002), binding("__anon5", 70), binding("__anon6", 90), binding("__anon7", 0.08), binding("Demand", 120)]),
            uses([
              proof(
                goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
                uses([
                  proof(
                    goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
                    uses([
                      proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                      proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                  proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
                  proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(gt(147.20000000000002, 120)), by(builtin(gt, 2))),
              proof(goal(sub(147.20000000000002, 120, 27.200000000000017)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(mul(27.200000000000017, 0.08, 2.1760000000000015)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

leachingIndex(low_input, 0.0).
why(
  leachingIndex(low_input, 0.0),
  proof(
    goal(leachingIndex(low_input, 0.0)), by(rule("field-nitrogen-balance.pl", clause(25))),
    bindings([binding("F", low_input), binding("I", 0.0)]),
    uses([
      proof(
        goal(leaching_index(low_input, 0.0)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", low_input), binding("Index", 0.0), binding("Surplus", 0.0), binding("__anon17", 25), binding("__anon18", 40), binding("Loss", 0.10), binding("__anon19", 110)]),
        uses([
          proof(
            goal(surplus_n(low_input, 0.0)), by(rule("field-nitrogen-balance.pl", clause(15))),
            bindings([binding("F", low_input), binding("Avail", 58.5), binding("__anon8", 25), binding("__anon9", 40), binding("__anon10", 0.10), binding("Demand", 110)]),
            uses([
              proof(
                goal(available_n(low_input, 58.5)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", low_input), binding("Avail", 58.5), binding("Total", 65), binding("__anon2", 25), binding("__anon3", 40), binding("Loss", 0.10), binding("__anon4", 110), binding("Retained", 0.90000000000000002)]),
                uses([
                  proof(
                    goal(total_n(low_input, 65)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", low_input), binding("Total", 65), binding("Soil", 25), binding("Fert", 40), binding("__anon0", 0.10), binding("__anon1", 110)]),
                    uses([
                      proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
                      proof(goal(add(25, 40, 65)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
                  proof(goal(sub(1.0, 0.10, 0.90000000000000002)), by(builtin(sub, 3))),
                  proof(goal(mul(65, 0.90000000000000002, 58.5)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
              proof(goal(le(58.5, 110)), by(builtin(le, 2)))
            ])
          ),
          proof(goal(field(low_input, 25, 40, 0.10, 110)), by(fact("field-nitrogen-balance.pl", clause(8)))),
          proof(goal(mul(0.0, 0.10, 0.0)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

leachingIndex(balanced_loam, 0.0).
why(
  leachingIndex(balanced_loam, 0.0),
  proof(
    goal(leachingIndex(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(25))),
    bindings([binding("F", balanced_loam), binding("I", 0.0)]),
    uses([
      proof(
        goal(leaching_index(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", balanced_loam), binding("Index", 0.0), binding("Surplus", 0.0), binding("__anon17", 45), binding("__anon18", 80), binding("Loss", 0.12), binding("__anon19", 110)]),
        uses([
          proof(
            goal(surplus_n(balanced_loam, 0.0)), by(rule("field-nitrogen-balance.pl", clause(15))),
            bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("__anon8", 45), binding("__anon9", 80), binding("__anon10", 0.12), binding("Demand", 110)]),
            uses([
              proof(
                goal(available_n(balanced_loam, 110.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", balanced_loam), binding("Avail", 110.0), binding("Total", 125), binding("__anon2", 45), binding("__anon3", 80), binding("Loss", 0.12), binding("__anon4", 110), binding("Retained", 0.88)]),
                uses([
                  proof(
                    goal(total_n(balanced_loam, 125)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", balanced_loam), binding("Total", 125), binding("Soil", 45), binding("Fert", 80), binding("__anon0", 0.12), binding("__anon1", 110)]),
                    uses([
                      proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                      proof(goal(add(45, 80, 125)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
                  proof(goal(sub(1.0, 0.12, 0.88)), by(builtin(sub, 3))),
                  proof(goal(mul(125, 0.88, 110.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
              proof(goal(le(110.0, 110)), by(builtin(le, 2)))
            ])
          ),
          proof(goal(field(balanced_loam, 45, 80, 0.12, 110)), by(fact("field-nitrogen-balance.pl", clause(9)))),
          proof(goal(mul(0.0, 0.12, 0.0)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

highestLeachingRisk(field_nitrogen_balance, sandy_high).
why(
  highestLeachingRisk(field_nitrogen_balance, sandy_high),
  proof(
    goal(highestLeachingRisk(field_nitrogen_balance, sandy_high)), by(rule("field-nitrogen-balance.pl", clause(26))),
    bindings([binding("Sandy", 4.1999999999999993), binding("Clay", 2.1760000000000015)]),
    uses([
      proof(
        goal(leaching_index(sandy_high, 4.1999999999999993)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", sandy_high), binding("Index", 4.1999999999999993), binding("Surplus", 12.0), binding("__anon17", 30), binding("__anon18", 150), binding("Loss", 0.35), binding("__anon19", 105)]),
        uses([
          proof(
            goal(surplus_n(sandy_high, 12.0)), by(rule("field-nitrogen-balance.pl", clause(14))),
            bindings([binding("F", sandy_high), binding("Surplus", 12.0), binding("Avail", 117.0), binding("__anon5", 30), binding("__anon6", 150), binding("__anon7", 0.35), binding("Demand", 105)]),
            uses([
              proof(
                goal(available_n(sandy_high, 117.0)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", sandy_high), binding("Avail", 117.0), binding("Total", 180), binding("__anon2", 30), binding("__anon3", 150), binding("Loss", 0.35), binding("__anon4", 105), binding("Retained", 0.65000000000000002)]),
                uses([
                  proof(
                    goal(total_n(sandy_high, 180)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", sandy_high), binding("Total", 180), binding("Soil", 30), binding("Fert", 150), binding("__anon0", 0.35), binding("__anon1", 105)]),
                    uses([
                      proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                      proof(goal(add(30, 150, 180)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
                  proof(goal(sub(1.0, 0.35, 0.65000000000000002)), by(builtin(sub, 3))),
                  proof(goal(mul(180, 0.65000000000000002, 117.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
              proof(goal(gt(117.0, 105)), by(builtin(gt, 2))),
              proof(goal(sub(117.0, 105, 12.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(field(sandy_high, 30, 150, 0.35, 105)), by(fact("field-nitrogen-balance.pl", clause(10)))),
          proof(goal(mul(12.0, 0.35, 4.1999999999999993)), by(builtin(mul, 3)))
        ])
      ),
      proof(
        goal(leaching_index(clay_surplus, 2.1760000000000015)), by(rule("field-nitrogen-balance.pl", clause(18))),
        bindings([binding("F", clay_surplus), binding("Index", 2.1760000000000015), binding("Surplus", 27.200000000000017), binding("__anon17", 70), binding("__anon18", 90), binding("Loss", 0.08), binding("__anon19", 120)]),
        uses([
          proof(
            goal(surplus_n(clay_surplus, 27.200000000000017)), by(rule("field-nitrogen-balance.pl", clause(14))),
            bindings([binding("F", clay_surplus), binding("Surplus", 27.200000000000017), binding("Avail", 147.20000000000002), binding("__anon5", 70), binding("__anon6", 90), binding("__anon7", 0.08), binding("Demand", 120)]),
            uses([
              proof(
                goal(available_n(clay_surplus, 147.20000000000002)), by(rule("field-nitrogen-balance.pl", clause(13))),
                bindings([binding("F", clay_surplus), binding("Avail", 147.20000000000002), binding("Total", 160), binding("__anon2", 70), binding("__anon3", 90), binding("Loss", 0.08), binding("__anon4", 120), binding("Retained", 0.92000000000000004)]),
                uses([
                  proof(
                    goal(total_n(clay_surplus, 160)), by(rule("field-nitrogen-balance.pl", clause(12))),
                    bindings([binding("F", clay_surplus), binding("Total", 160), binding("Soil", 70), binding("Fert", 90), binding("__anon0", 0.08), binding("__anon1", 120)]),
                    uses([
                      proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                      proof(goal(add(70, 90, 160)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
                  proof(goal(sub(1.0, 0.08, 0.92000000000000004)), by(builtin(sub, 3))),
                  proof(goal(mul(160, 0.92000000000000004, 147.20000000000002)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
              proof(goal(gt(147.20000000000002, 120)), by(builtin(gt, 2))),
              proof(goal(sub(147.20000000000002, 120, 27.200000000000017)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(field(clay_surplus, 70, 90, 0.08, 120)), by(fact("field-nitrogen-balance.pl", clause(11)))),
          proof(goal(mul(27.200000000000017, 0.08, 2.1760000000000015)), by(builtin(mul, 3)))
        ])
      ),
      proof(goal(gt(4.1999999999999993, 2.1760000000000015)), by(builtin(gt, 2)))
    ])
  )
).

