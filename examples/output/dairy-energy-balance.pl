status(early_lactation, negative_energy_balance).
why(
  status(early_lactation, negative_energy_balance),
  proof(
    goal(status(early_lactation, negative_energy_balance)), by(rule("dairy-energy-balance.pl", clause(16))),
    bindings([binding("C", early_lactation), binding("B", -101.19999999999999)]),
    uses([
      proof(
        goal(energy_balance(early_lactation, -101.19999999999999)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", early_lactation), binding("B", -101.19999999999999), binding("S", 140.80000000000001), binding("R", 242.0)]),
        uses([
          proof(
            goal(ration_supply(early_lactation, 140.80000000000001)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", early_lactation), binding("S", 140.80000000000001), binding("__anon6", 650), binding("__anon7", 38), binding("Density", 6.4), binding("Intake", 22)]),
            uses([
              proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
              proof(goal(mul(6.4, 22, 140.80000000000001)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(early_lactation, 242.0)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", early_lactation), binding("R", 242.0), binding("M", 52.0), binding("MilkR", 190.0)]),
            uses([
              proof(
                goal(maintenance(early_lactation, 52.0)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", early_lactation), binding("M", 52.0), binding("Weight", 650), binding("__anon0", 38), binding("__anon1", 6.4), binding("__anon2", 22)]),
                uses([
                  proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                  proof(goal(mul(650, 0.08, 52.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(early_lactation, 190.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", early_lactation), binding("R", 190.0), binding("__anon3", 650), binding("Milk", 38), binding("__anon4", 6.4), binding("__anon5", 22)]),
                uses([
                  proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                  proof(goal(mul(38, 5.0, 190.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(52.0, 190.0, 242.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(140.80000000000001, 242.0, -101.19999999999999)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(lt(-101.19999999999999, -5.0)), by(builtin(lt, 2)))
    ])
  )
).

status(grazing, negative_energy_balance).
why(
  status(grazing, negative_energy_balance),
  proof(
    goal(status(grazing, negative_energy_balance)), by(rule("dairy-energy-balance.pl", clause(16))),
    bindings([binding("C", grazing), binding("B", -11.399999999999991)]),
    uses([
      proof(
        goal(energy_balance(grazing, -11.399999999999991)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", grazing), binding("B", -11.399999999999991), binding("S", 121.8), binding("R", 133.19999999999999)]),
        uses([
          proof(
            goal(ration_supply(grazing, 121.8)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", grazing), binding("S", 121.8), binding("__anon6", 540), binding("__anon7", 18), binding("Density", 5.8), binding("Intake", 21)]),
            uses([
              proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
              proof(goal(mul(5.8, 21, 121.8)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(grazing, 133.19999999999999)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", grazing), binding("R", 133.19999999999999), binding("M", 43.200000000000003), binding("MilkR", 90.0)]),
            uses([
              proof(
                goal(maintenance(grazing, 43.200000000000003)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", grazing), binding("M", 43.200000000000003), binding("Weight", 540), binding("__anon0", 18), binding("__anon1", 5.8), binding("__anon2", 21)]),
                uses([
                  proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
                  proof(goal(mul(540, 0.08, 43.200000000000003)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(grazing, 90.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", grazing), binding("R", 90.0), binding("__anon3", 540), binding("Milk", 18), binding("__anon4", 5.8), binding("__anon5", 21)]),
                uses([
                  proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
                  proof(goal(mul(18, 5.0, 90.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(43.200000000000003, 90.0, 133.19999999999999)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(121.8, 133.19999999999999, -11.399999999999991)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(lt(-11.399999999999991, -5.0)), by(builtin(lt, 2)))
    ])
  )
).

status(mid_lactation, near_neutral_energy_balance).
why(
  status(mid_lactation, near_neutral_energy_balance),
  proof(
    goal(status(mid_lactation, near_neutral_energy_balance)), by(rule("dairy-energy-balance.pl", clause(17))),
    bindings([binding("C", mid_lactation), binding("B", 0.19999999999998863)]),
    uses([
      proof(
        goal(energy_balance(mid_lactation, 0.19999999999998863)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", mid_lactation), binding("B", 0.19999999999998863), binding("S", 169.0), binding("R", 168.80000000000001)]),
        uses([
          proof(
            goal(ration_supply(mid_lactation, 169.0)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", mid_lactation), binding("S", 169.0), binding("__anon6", 610), binding("__anon7", 24), binding("Density", 6.5), binding("Intake", 26)]),
            uses([
              proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
              proof(goal(mul(6.5, 26, 169.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(mid_lactation, 168.80000000000001)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", mid_lactation), binding("R", 168.80000000000001), binding("M", 48.800000000000004), binding("MilkR", 120.0)]),
            uses([
              proof(
                goal(maintenance(mid_lactation, 48.800000000000004)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", mid_lactation), binding("M", 48.800000000000004), binding("Weight", 610), binding("__anon0", 24), binding("__anon1", 6.5), binding("__anon2", 26)]),
                uses([
                  proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
                  proof(goal(mul(610, 0.08, 48.800000000000004)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(mid_lactation, 120.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", mid_lactation), binding("R", 120.0), binding("__anon3", 610), binding("Milk", 24), binding("__anon4", 6.5), binding("__anon5", 26)]),
                uses([
                  proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
                  proof(goal(mul(24, 5.0, 120.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(48.800000000000004, 120.0, 168.80000000000001)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(169.0, 168.80000000000001, 0.19999999999998863)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(ge(0.19999999999998863, -5.0)), by(builtin(ge, 2))),
      proof(goal(le(0.19999999999998863, 5.0)), by(builtin(le, 2)))
    ])
  )
).

status(late_lactation, positive_energy_balance).
why(
  status(late_lactation, positive_energy_balance),
  proof(
    goal(status(late_lactation, positive_energy_balance)), by(rule("dairy-energy-balance.pl", clause(18))),
    bindings([binding("C", late_lactation), binding("B", 41.099999999999994)]),
    uses([
      proof(
        goal(energy_balance(late_lactation, 41.099999999999994)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", late_lactation), binding("B", 41.099999999999994), binding("S", 167.5), binding("R", 126.40000000000001)]),
        uses([
          proof(
            goal(ration_supply(late_lactation, 167.5)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", late_lactation), binding("S", 167.5), binding("__anon6", 580), binding("__anon7", 16), binding("Density", 6.7), binding("Intake", 25)]),
            uses([
              proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
              proof(goal(mul(6.7, 25, 167.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(late_lactation, 126.40000000000001)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", late_lactation), binding("R", 126.40000000000001), binding("M", 46.399999999999999), binding("MilkR", 80.0)]),
            uses([
              proof(
                goal(maintenance(late_lactation, 46.399999999999999)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", late_lactation), binding("M", 46.399999999999999), binding("Weight", 580), binding("__anon0", 16), binding("__anon1", 6.7), binding("__anon2", 25)]),
                uses([
                  proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                  proof(goal(mul(580, 0.08, 46.399999999999999)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(late_lactation, 80.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", late_lactation), binding("R", 80.0), binding("__anon3", 580), binding("Milk", 16), binding("__anon4", 6.7), binding("__anon5", 25)]),
                uses([
                  proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                  proof(goal(mul(16, 5.0, 80.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(46.399999999999999, 80.0, 126.40000000000001)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(167.5, 126.40000000000001, 41.099999999999994)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(gt(41.099999999999994, 5.0)), by(builtin(gt, 2)))
    ])
  )
).

energyBalance_Mcal(early_lactation, -101.19999999999999).
why(
  energyBalance_Mcal(early_lactation, -101.19999999999999),
  proof(
    goal(energyBalance_Mcal(early_lactation, -101.19999999999999)), by(rule("dairy-energy-balance.pl", clause(19))),
    bindings([binding("C", early_lactation), binding("B", -101.19999999999999)]),
    uses([
      proof(
        goal(energy_balance(early_lactation, -101.19999999999999)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", early_lactation), binding("B", -101.19999999999999), binding("S", 140.80000000000001), binding("R", 242.0)]),
        uses([
          proof(
            goal(ration_supply(early_lactation, 140.80000000000001)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", early_lactation), binding("S", 140.80000000000001), binding("__anon6", 650), binding("__anon7", 38), binding("Density", 6.4), binding("Intake", 22)]),
            uses([
              proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
              proof(goal(mul(6.4, 22, 140.80000000000001)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(early_lactation, 242.0)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", early_lactation), binding("R", 242.0), binding("M", 52.0), binding("MilkR", 190.0)]),
            uses([
              proof(
                goal(maintenance(early_lactation, 52.0)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", early_lactation), binding("M", 52.0), binding("Weight", 650), binding("__anon0", 38), binding("__anon1", 6.4), binding("__anon2", 22)]),
                uses([
                  proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                  proof(goal(mul(650, 0.08, 52.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(early_lactation, 190.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", early_lactation), binding("R", 190.0), binding("__anon3", 650), binding("Milk", 38), binding("__anon4", 6.4), binding("__anon5", 22)]),
                uses([
                  proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                  proof(goal(mul(38, 5.0, 190.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(52.0, 190.0, 242.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(140.80000000000001, 242.0, -101.19999999999999)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

energyBalance_Mcal(mid_lactation, 0.19999999999998863).
why(
  energyBalance_Mcal(mid_lactation, 0.19999999999998863),
  proof(
    goal(energyBalance_Mcal(mid_lactation, 0.19999999999998863)), by(rule("dairy-energy-balance.pl", clause(19))),
    bindings([binding("C", mid_lactation), binding("B", 0.19999999999998863)]),
    uses([
      proof(
        goal(energy_balance(mid_lactation, 0.19999999999998863)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", mid_lactation), binding("B", 0.19999999999998863), binding("S", 169.0), binding("R", 168.80000000000001)]),
        uses([
          proof(
            goal(ration_supply(mid_lactation, 169.0)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", mid_lactation), binding("S", 169.0), binding("__anon6", 610), binding("__anon7", 24), binding("Density", 6.5), binding("Intake", 26)]),
            uses([
              proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
              proof(goal(mul(6.5, 26, 169.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(mid_lactation, 168.80000000000001)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", mid_lactation), binding("R", 168.80000000000001), binding("M", 48.800000000000004), binding("MilkR", 120.0)]),
            uses([
              proof(
                goal(maintenance(mid_lactation, 48.800000000000004)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", mid_lactation), binding("M", 48.800000000000004), binding("Weight", 610), binding("__anon0", 24), binding("__anon1", 6.5), binding("__anon2", 26)]),
                uses([
                  proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
                  proof(goal(mul(610, 0.08, 48.800000000000004)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(mid_lactation, 120.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", mid_lactation), binding("R", 120.0), binding("__anon3", 610), binding("Milk", 24), binding("__anon4", 6.5), binding("__anon5", 26)]),
                uses([
                  proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
                  proof(goal(mul(24, 5.0, 120.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(48.800000000000004, 120.0, 168.80000000000001)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(169.0, 168.80000000000001, 0.19999999999998863)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

energyBalance_Mcal(late_lactation, 41.099999999999994).
why(
  energyBalance_Mcal(late_lactation, 41.099999999999994),
  proof(
    goal(energyBalance_Mcal(late_lactation, 41.099999999999994)), by(rule("dairy-energy-balance.pl", clause(19))),
    bindings([binding("C", late_lactation), binding("B", 41.099999999999994)]),
    uses([
      proof(
        goal(energy_balance(late_lactation, 41.099999999999994)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", late_lactation), binding("B", 41.099999999999994), binding("S", 167.5), binding("R", 126.40000000000001)]),
        uses([
          proof(
            goal(ration_supply(late_lactation, 167.5)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", late_lactation), binding("S", 167.5), binding("__anon6", 580), binding("__anon7", 16), binding("Density", 6.7), binding("Intake", 25)]),
            uses([
              proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
              proof(goal(mul(6.7, 25, 167.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(late_lactation, 126.40000000000001)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", late_lactation), binding("R", 126.40000000000001), binding("M", 46.399999999999999), binding("MilkR", 80.0)]),
            uses([
              proof(
                goal(maintenance(late_lactation, 46.399999999999999)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", late_lactation), binding("M", 46.399999999999999), binding("Weight", 580), binding("__anon0", 16), binding("__anon1", 6.7), binding("__anon2", 25)]),
                uses([
                  proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                  proof(goal(mul(580, 0.08, 46.399999999999999)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(late_lactation, 80.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", late_lactation), binding("R", 80.0), binding("__anon3", 580), binding("Milk", 16), binding("__anon4", 6.7), binding("__anon5", 25)]),
                uses([
                  proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                  proof(goal(mul(16, 5.0, 80.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(46.399999999999999, 80.0, 126.40000000000001)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(167.5, 126.40000000000001, 41.099999999999994)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

energyBalance_Mcal(grazing, -11.399999999999991).
why(
  energyBalance_Mcal(grazing, -11.399999999999991),
  proof(
    goal(energyBalance_Mcal(grazing, -11.399999999999991)), by(rule("dairy-energy-balance.pl", clause(19))),
    bindings([binding("C", grazing), binding("B", -11.399999999999991)]),
    uses([
      proof(
        goal(energy_balance(grazing, -11.399999999999991)), by(rule("dairy-energy-balance.pl", clause(14))),
        bindings([binding("C", grazing), binding("B", -11.399999999999991), binding("S", 121.8), binding("R", 133.19999999999999)]),
        uses([
          proof(
            goal(ration_supply(grazing, 121.8)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", grazing), binding("S", 121.8), binding("__anon6", 540), binding("__anon7", 18), binding("Density", 5.8), binding("Intake", 21)]),
            uses([
              proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
              proof(goal(mul(5.8, 21, 121.8)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(total_requirement(grazing, 133.19999999999999)), by(rule("dairy-energy-balance.pl", clause(13))),
            bindings([binding("C", grazing), binding("R", 133.19999999999999), binding("M", 43.200000000000003), binding("MilkR", 90.0)]),
            uses([
              proof(
                goal(maintenance(grazing, 43.200000000000003)), by(rule("dairy-energy-balance.pl", clause(10))),
                bindings([binding("C", grazing), binding("M", 43.200000000000003), binding("Weight", 540), binding("__anon0", 18), binding("__anon1", 5.8), binding("__anon2", 21)]),
                uses([
                  proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
                  proof(goal(mul(540, 0.08, 43.200000000000003)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(milk_requirement(grazing, 90.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                bindings([binding("C", grazing), binding("R", 90.0), binding("__anon3", 540), binding("Milk", 18), binding("__anon4", 5.8), binding("__anon5", 21)]),
                uses([
                  proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
                  proof(goal(mul(18, 5.0, 90.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(add(43.200000000000003, 90.0, 133.19999999999999)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sub(121.8, 133.19999999999999, -11.399999999999991)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

rationSupportedMilk_kg(early_lactation, 17.760000000000002).
why(
  rationSupportedMilk_kg(early_lactation, 17.760000000000002),
  proof(
    goal(rationSupportedMilk_kg(early_lactation, 17.760000000000002)), by(rule("dairy-energy-balance.pl", clause(20))),
    bindings([binding("C", early_lactation), binding("M", 17.760000000000002)]),
    uses([
      proof(
        goal(ration_supported_milk(early_lactation, 17.760000000000002)), by(rule("dairy-energy-balance.pl", clause(15))),
        bindings([binding("C", early_lactation), binding("Milk", 17.760000000000002), binding("S", 140.80000000000001), binding("M", 52.0), binding("AvailableForMilk", 88.800000000000011)]),
        uses([
          proof(
            goal(ration_supply(early_lactation, 140.80000000000001)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", early_lactation), binding("S", 140.80000000000001), binding("__anon6", 650), binding("__anon7", 38), binding("Density", 6.4), binding("Intake", 22)]),
            uses([
              proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
              proof(goal(mul(6.4, 22, 140.80000000000001)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(maintenance(early_lactation, 52.0)), by(rule("dairy-energy-balance.pl", clause(10))),
            bindings([binding("C", early_lactation), binding("M", 52.0), binding("Weight", 650), binding("__anon0", 38), binding("__anon1", 6.4), binding("__anon2", 22)]),
            uses([
              proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
              proof(goal(mul(650, 0.08, 52.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(sub(140.80000000000001, 52.0, 88.800000000000011)), by(builtin(sub, 3))),
          proof(goal(div(88.800000000000011, 5.0, 17.760000000000002)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

rationSupportedMilk_kg(mid_lactation, 24.039999999999999).
why(
  rationSupportedMilk_kg(mid_lactation, 24.039999999999999),
  proof(
    goal(rationSupportedMilk_kg(mid_lactation, 24.039999999999999)), by(rule("dairy-energy-balance.pl", clause(20))),
    bindings([binding("C", mid_lactation), binding("M", 24.039999999999999)]),
    uses([
      proof(
        goal(ration_supported_milk(mid_lactation, 24.039999999999999)), by(rule("dairy-energy-balance.pl", clause(15))),
        bindings([binding("C", mid_lactation), binding("Milk", 24.039999999999999), binding("S", 169.0), binding("M", 48.800000000000004), binding("AvailableForMilk", 120.19999999999999)]),
        uses([
          proof(
            goal(ration_supply(mid_lactation, 169.0)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", mid_lactation), binding("S", 169.0), binding("__anon6", 610), binding("__anon7", 24), binding("Density", 6.5), binding("Intake", 26)]),
            uses([
              proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
              proof(goal(mul(6.5, 26, 169.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(maintenance(mid_lactation, 48.800000000000004)), by(rule("dairy-energy-balance.pl", clause(10))),
            bindings([binding("C", mid_lactation), binding("M", 48.800000000000004), binding("Weight", 610), binding("__anon0", 24), binding("__anon1", 6.5), binding("__anon2", 26)]),
            uses([
              proof(goal(cow(mid_lactation, 610, 24, 6.5, 26)), by(fact("dairy-energy-balance.pl", clause(7)))),
              proof(goal(mul(610, 0.08, 48.800000000000004)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(sub(169.0, 48.800000000000004, 120.19999999999999)), by(builtin(sub, 3))),
          proof(goal(div(120.19999999999999, 5.0, 24.039999999999999)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

rationSupportedMilk_kg(late_lactation, 24.219999999999999).
why(
  rationSupportedMilk_kg(late_lactation, 24.219999999999999),
  proof(
    goal(rationSupportedMilk_kg(late_lactation, 24.219999999999999)), by(rule("dairy-energy-balance.pl", clause(20))),
    bindings([binding("C", late_lactation), binding("M", 24.219999999999999)]),
    uses([
      proof(
        goal(ration_supported_milk(late_lactation, 24.219999999999999)), by(rule("dairy-energy-balance.pl", clause(15))),
        bindings([binding("C", late_lactation), binding("Milk", 24.219999999999999), binding("S", 167.5), binding("M", 46.399999999999999), binding("AvailableForMilk", 121.09999999999999)]),
        uses([
          proof(
            goal(ration_supply(late_lactation, 167.5)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", late_lactation), binding("S", 167.5), binding("__anon6", 580), binding("__anon7", 16), binding("Density", 6.7), binding("Intake", 25)]),
            uses([
              proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
              proof(goal(mul(6.7, 25, 167.5)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(maintenance(late_lactation, 46.399999999999999)), by(rule("dairy-energy-balance.pl", clause(10))),
            bindings([binding("C", late_lactation), binding("M", 46.399999999999999), binding("Weight", 580), binding("__anon0", 16), binding("__anon1", 6.7), binding("__anon2", 25)]),
            uses([
              proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
              proof(goal(mul(580, 0.08, 46.399999999999999)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(sub(167.5, 46.399999999999999, 121.09999999999999)), by(builtin(sub, 3))),
          proof(goal(div(121.09999999999999, 5.0, 24.219999999999999)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

rationSupportedMilk_kg(grazing, 15.719999999999999).
why(
  rationSupportedMilk_kg(grazing, 15.719999999999999),
  proof(
    goal(rationSupportedMilk_kg(grazing, 15.719999999999999)), by(rule("dairy-energy-balance.pl", clause(20))),
    bindings([binding("C", grazing), binding("M", 15.719999999999999)]),
    uses([
      proof(
        goal(ration_supported_milk(grazing, 15.719999999999999)), by(rule("dairy-energy-balance.pl", clause(15))),
        bindings([binding("C", grazing), binding("Milk", 15.719999999999999), binding("S", 121.8), binding("M", 43.200000000000003), binding("AvailableForMilk", 78.599999999999994)]),
        uses([
          proof(
            goal(ration_supply(grazing, 121.8)), by(rule("dairy-energy-balance.pl", clause(12))),
            bindings([binding("C", grazing), binding("S", 121.8), binding("__anon6", 540), binding("__anon7", 18), binding("Density", 5.8), binding("Intake", 21)]),
            uses([
              proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
              proof(goal(mul(5.8, 21, 121.8)), by(builtin(mul, 3)))
            ])
          ),
          proof(
            goal(maintenance(grazing, 43.200000000000003)), by(rule("dairy-energy-balance.pl", clause(10))),
            bindings([binding("C", grazing), binding("M", 43.200000000000003), binding("Weight", 540), binding("__anon0", 18), binding("__anon1", 5.8), binding("__anon2", 21)]),
            uses([
              proof(goal(cow(grazing, 540, 18, 5.8, 21)), by(fact("dairy-energy-balance.pl", clause(9)))),
              proof(goal(mul(540, 0.08, 43.200000000000003)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(sub(121.8, 43.200000000000003, 78.599999999999994)), by(builtin(sub, 3))),
          proof(goal(div(78.599999999999994, 5.0, 15.719999999999999)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

strongestDeficit(dairy_energy_balance, early_lactation).
why(
  strongestDeficit(dairy_energy_balance, early_lactation),
  proof(
    goal(strongestDeficit(dairy_energy_balance, early_lactation)), by(rule("dairy-energy-balance.pl", clause(22))),
    uses([
      proof(
        goal(status(early_lactation, negative_energy_balance)), by(rule("dairy-energy-balance.pl", clause(16))),
        bindings([binding("C", early_lactation), binding("B", -101.19999999999999)]),
        uses([
          proof(
            goal(energy_balance(early_lactation, -101.19999999999999)), by(rule("dairy-energy-balance.pl", clause(14))),
            bindings([binding("C", early_lactation), binding("B", -101.19999999999999), binding("S", 140.80000000000001), binding("R", 242.0)]),
            uses([
              proof(
                goal(ration_supply(early_lactation, 140.80000000000001)), by(rule("dairy-energy-balance.pl", clause(12))),
                bindings([binding("C", early_lactation), binding("S", 140.80000000000001), binding("__anon6", 650), binding("__anon7", 38), binding("Density", 6.4), binding("Intake", 22)]),
                uses([
                  proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                  proof(goal(mul(6.4, 22, 140.80000000000001)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(total_requirement(early_lactation, 242.0)), by(rule("dairy-energy-balance.pl", clause(13))),
                bindings([binding("C", early_lactation), binding("R", 242.0), binding("M", 52.0), binding("MilkR", 190.0)]),
                uses([
                  proof(
                    goal(maintenance(early_lactation, 52.0)), by(rule("dairy-energy-balance.pl", clause(10))),
                    bindings([binding("C", early_lactation), binding("M", 52.0), binding("Weight", 650), binding("__anon0", 38), binding("__anon1", 6.4), binding("__anon2", 22)]),
                    uses([
                      proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                      proof(goal(mul(650, 0.08, 52.0)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(
                    goal(milk_requirement(early_lactation, 190.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                    bindings([binding("C", early_lactation), binding("R", 190.0), binding("__anon3", 650), binding("Milk", 38), binding("__anon4", 6.4), binding("__anon5", 22)]),
                    uses([
                      proof(goal(cow(early_lactation, 650, 38, 6.4, 22)), by(fact("dairy-energy-balance.pl", clause(6)))),
                      proof(goal(mul(38, 5.0, 190.0)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(add(52.0, 190.0, 242.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(sub(140.80000000000001, 242.0, -101.19999999999999)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(lt(-101.19999999999999, -5.0)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(status(late_lactation, positive_energy_balance)), by(rule("dairy-energy-balance.pl", clause(18))),
        bindings([binding("C", late_lactation), binding("B", 41.099999999999994)]),
        uses([
          proof(
            goal(energy_balance(late_lactation, 41.099999999999994)), by(rule("dairy-energy-balance.pl", clause(14))),
            bindings([binding("C", late_lactation), binding("B", 41.099999999999994), binding("S", 167.5), binding("R", 126.40000000000001)]),
            uses([
              proof(
                goal(ration_supply(late_lactation, 167.5)), by(rule("dairy-energy-balance.pl", clause(12))),
                bindings([binding("C", late_lactation), binding("S", 167.5), binding("__anon6", 580), binding("__anon7", 16), binding("Density", 6.7), binding("Intake", 25)]),
                uses([
                  proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                  proof(goal(mul(6.7, 25, 167.5)), by(builtin(mul, 3)))
                ])
              ),
              proof(
                goal(total_requirement(late_lactation, 126.40000000000001)), by(rule("dairy-energy-balance.pl", clause(13))),
                bindings([binding("C", late_lactation), binding("R", 126.40000000000001), binding("M", 46.399999999999999), binding("MilkR", 80.0)]),
                uses([
                  proof(
                    goal(maintenance(late_lactation, 46.399999999999999)), by(rule("dairy-energy-balance.pl", clause(10))),
                    bindings([binding("C", late_lactation), binding("M", 46.399999999999999), binding("Weight", 580), binding("__anon0", 16), binding("__anon1", 6.7), binding("__anon2", 25)]),
                    uses([
                      proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                      proof(goal(mul(580, 0.08, 46.399999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(
                    goal(milk_requirement(late_lactation, 80.0)), by(rule("dairy-energy-balance.pl", clause(11))),
                    bindings([binding("C", late_lactation), binding("R", 80.0), binding("__anon3", 580), binding("Milk", 16), binding("__anon4", 6.7), binding("__anon5", 25)]),
                    uses([
                      proof(goal(cow(late_lactation, 580, 16, 6.7, 25)), by(fact("dairy-energy-balance.pl", clause(8)))),
                      proof(goal(mul(16, 5.0, 80.0)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(add(46.399999999999999, 80.0, 126.40000000000001)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(sub(167.5, 126.40000000000001, 41.099999999999994)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(gt(41.099999999999994, 5.0)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

