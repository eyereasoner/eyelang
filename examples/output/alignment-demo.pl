broader(tel_car, ref_car).
why(
  broader(tel_car, ref_car),
  proof(
    goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
    bindings([binding("X", tel_car), binding("Y", ref_car)]),
    uses([
      proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
    ])
  )
).

broader(tel_heavy_vehicle, ref_car).
why(
  broader(tel_heavy_vehicle, ref_car),
  proof(
    goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
    bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
    uses([
      proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
    ])
  )
).

broader(anpr_vehicle_with_plate, ref_car).
why(
  broader(anpr_vehicle_with_plate, ref_car),
  proof(
    goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
    uses([
      proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
    ])
  )
).

broader(anpr_passenger_car, anpr_vehicle_with_plate).
why(
  broader(anpr_passenger_car, anpr_vehicle_with_plate),
  proof(
    goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
    bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
    ])
  )
).

narrower(ref_car, tel_car).
why(
  narrower(ref_car, tel_car),
  proof(
    goal(narrower(ref_car, tel_car)), by(rule("alignment-demo.pl", clause(18))),
    bindings([binding("X", ref_car), binding("Y", tel_car)]),
    uses([
      proof(
        goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", tel_car), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
        ])
      )
    ])
  )
).

narrower(ref_car, tel_heavy_vehicle).
why(
  narrower(ref_car, tel_heavy_vehicle),
  proof(
    goal(narrower(ref_car, tel_heavy_vehicle)), by(rule("alignment-demo.pl", clause(18))),
    bindings([binding("X", ref_car), binding("Y", tel_heavy_vehicle)]),
    uses([
      proof(
        goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
        ])
      )
    ])
  )
).

narrower(ref_car, anpr_vehicle_with_plate).
why(
  narrower(ref_car, anpr_vehicle_with_plate),
  proof(
    goal(narrower(ref_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(18))),
    bindings([binding("X", ref_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
        ])
      )
    ])
  )
).

narrower(anpr_vehicle_with_plate, anpr_passenger_car).
why(
  narrower(anpr_vehicle_with_plate, anpr_passenger_car),
  proof(
    goal(narrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(18))),
    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", anpr_passenger_car)]),
    uses([
      proof(
        goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
        bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
        ])
      )
    ])
  )
).

broaderTransitive(tel_car, ref_car).
why(
  broaderTransitive(tel_car, ref_car),
  proof(
    goal(broaderTransitive(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(19))),
    bindings([binding("X", tel_car), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", tel_car), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
        ])
      )
    ])
  )
).

broaderTransitive(tel_heavy_vehicle, ref_car).
why(
  broaderTransitive(tel_heavy_vehicle, ref_car),
  proof(
    goal(broaderTransitive(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(19))),
    bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
        ])
      )
    ])
  )
).

broaderTransitive(anpr_vehicle_with_plate, ref_car).
why(
  broaderTransitive(anpr_vehicle_with_plate, ref_car),
  proof(
    goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
        uses([
          proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
        ])
      )
    ])
  )
).

broaderTransitive(anpr_passenger_car, anpr_vehicle_with_plate).
why(
  broaderTransitive(anpr_passenger_car, anpr_vehicle_with_plate),
  proof(
    goal(broaderTransitive(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(19))),
    bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
        bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
        ])
      )
    ])
  )
).

broaderTransitive(anpr_passenger_car, ref_car).
why(
  broaderTransitive(anpr_passenger_car, ref_car),
  proof(
    goal(broaderTransitive(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(20))),
    bindings([binding("X", anpr_passenger_car), binding("Z", ref_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
        bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
        ])
      ),
      proof(
        goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerTransitive(ref_car, tel_car).
why(
  narrowerTransitive(ref_car, tel_car),
  proof(
    goal(narrowerTransitive(ref_car, tel_car)), by(rule("alignment-demo.pl", clause(21))),
    bindings([binding("X", ref_car), binding("Y", tel_car)]),
    uses([
      proof(
        goal(narrower(ref_car, tel_car)), by(rule("alignment-demo.pl", clause(18))),
        bindings([binding("X", ref_car), binding("Y", tel_car)]),
        uses([
          proof(
            goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", tel_car), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerTransitive(ref_car, tel_heavy_vehicle).
why(
  narrowerTransitive(ref_car, tel_heavy_vehicle),
  proof(
    goal(narrowerTransitive(ref_car, tel_heavy_vehicle)), by(rule("alignment-demo.pl", clause(21))),
    bindings([binding("X", ref_car), binding("Y", tel_heavy_vehicle)]),
    uses([
      proof(
        goal(narrower(ref_car, tel_heavy_vehicle)), by(rule("alignment-demo.pl", clause(18))),
        bindings([binding("X", ref_car), binding("Y", tel_heavy_vehicle)]),
        uses([
          proof(
            goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerTransitive(ref_car, anpr_vehicle_with_plate).
why(
  narrowerTransitive(ref_car, anpr_vehicle_with_plate),
  proof(
    goal(narrowerTransitive(ref_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(21))),
    bindings([binding("X", ref_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(narrower(ref_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(18))),
        bindings([binding("X", ref_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(
            goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerTransitive(anpr_vehicle_with_plate, anpr_passenger_car).
why(
  narrowerTransitive(anpr_vehicle_with_plate, anpr_passenger_car),
  proof(
    goal(narrowerTransitive(anpr_vehicle_with_plate, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(21))),
    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", anpr_passenger_car)]),
    uses([
      proof(
        goal(narrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(18))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", anpr_passenger_car)]),
        uses([
          proof(
            goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
            bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
            uses([
              proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerTransitive(ref_car, anpr_passenger_car).
why(
  narrowerTransitive(ref_car, anpr_passenger_car),
  proof(
    goal(narrowerTransitive(ref_car, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(22))),
    bindings([binding("X", ref_car), binding("Z", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(narrower(ref_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(18))),
        bindings([binding("X", ref_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(
            goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
            ])
          )
        ])
      ),
      proof(
        goal(narrowerTransitive(anpr_vehicle_with_plate, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(21))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", anpr_passenger_car)]),
        uses([
          proof(
            goal(narrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(18))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", anpr_passenger_car)]),
            uses([
              proof(
                goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
                bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
                uses([
                  proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

narrowerOrEqualOf(ref_car, ref_car).
why(
  narrowerOrEqualOf(ref_car, ref_car),
  proof(
    goal(narrowerOrEqualOf(ref_car, ref_car)), by(rule("alignment-demo.pl", clause(23))),
    bindings([binding("X", ref_car)]),
    uses([
      proof(goal(concept(ref_car)), by(fact("alignment-demo.pl", clause(7))))
    ])
  )
).

narrowerOrEqualOf(tel_car, tel_car).
why(
  narrowerOrEqualOf(tel_car, tel_car),
  proof(
    goal(narrowerOrEqualOf(tel_car, tel_car)), by(rule("alignment-demo.pl", clause(23))),
    bindings([binding("X", tel_car)]),
    uses([
      proof(goal(concept(tel_car)), by(fact("alignment-demo.pl", clause(8))))
    ])
  )
).

narrowerOrEqualOf(tel_heavy_vehicle, tel_heavy_vehicle).
why(
  narrowerOrEqualOf(tel_heavy_vehicle, tel_heavy_vehicle),
  proof(
    goal(narrowerOrEqualOf(tel_heavy_vehicle, tel_heavy_vehicle)), by(rule("alignment-demo.pl", clause(23))),
    bindings([binding("X", tel_heavy_vehicle)]),
    uses([
      proof(goal(concept(tel_heavy_vehicle)), by(fact("alignment-demo.pl", clause(9))))
    ])
  )
).

narrowerOrEqualOf(anpr_vehicle_with_plate, anpr_vehicle_with_plate).
why(
  narrowerOrEqualOf(anpr_vehicle_with_plate, anpr_vehicle_with_plate),
  proof(
    goal(narrowerOrEqualOf(anpr_vehicle_with_plate, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(23))),
    bindings([binding("X", anpr_vehicle_with_plate)]),
    uses([
      proof(goal(concept(anpr_vehicle_with_plate)), by(fact("alignment-demo.pl", clause(10))))
    ])
  )
).

narrowerOrEqualOf(anpr_passenger_car, anpr_passenger_car).
why(
  narrowerOrEqualOf(anpr_passenger_car, anpr_passenger_car),
  proof(
    goal(narrowerOrEqualOf(anpr_passenger_car, anpr_passenger_car)), by(rule("alignment-demo.pl", clause(23))),
    bindings([binding("X", anpr_passenger_car)]),
    uses([
      proof(goal(concept(anpr_passenger_car)), by(fact("alignment-demo.pl", clause(11))))
    ])
  )
).

narrowerOrEqualOf(tel_car, ref_car).
why(
  narrowerOrEqualOf(tel_car, ref_car),
  proof(
    goal(narrowerOrEqualOf(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(24))),
    bindings([binding("X", tel_car), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broaderTransitive(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(19))),
        bindings([binding("X", tel_car), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", tel_car), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerOrEqualOf(tel_heavy_vehicle, ref_car).
why(
  narrowerOrEqualOf(tel_heavy_vehicle, ref_car),
  proof(
    goal(narrowerOrEqualOf(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(24))),
    bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broaderTransitive(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(19))),
        bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerOrEqualOf(anpr_vehicle_with_plate, ref_car).
why(
  narrowerOrEqualOf(anpr_vehicle_with_plate, ref_car),
  proof(
    goal(narrowerOrEqualOf(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(24))),
    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerOrEqualOf(anpr_passenger_car, anpr_vehicle_with_plate).
why(
  narrowerOrEqualOf(anpr_passenger_car, anpr_vehicle_with_plate),
  proof(
    goal(narrowerOrEqualOf(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(24))),
    bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(broaderTransitive(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(19))),
        bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(
            goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
            bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
            uses([
              proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
            ])
          )
        ])
      )
    ])
  )
).

narrowerOrEqualOf(anpr_passenger_car, ref_car).
why(
  narrowerOrEqualOf(anpr_passenger_car, ref_car),
  proof(
    goal(narrowerOrEqualOf(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(24))),
    bindings([binding("X", anpr_passenger_car), binding("Y", ref_car)]),
    uses([
      proof(
        goal(broaderTransitive(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(20))),
        bindings([binding("X", anpr_passenger_car), binding("Z", ref_car), binding("Y", anpr_vehicle_with_plate)]),
        uses([
          proof(
            goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
            bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
            uses([
              proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
            ])
          ),
          proof(
            goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(
                goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
                bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
                uses([
                  proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

rollsUpTo(tel_car, ref_car).
why(
  rollsUpTo(tel_car, ref_car),
  proof(
    goal(rollsUpTo(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(25))),
    bindings([binding("X", tel_car)]),
    uses([
      proof(
        goal(narrowerOrEqualOf(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(24))),
        bindings([binding("X", tel_car), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broaderTransitive(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(19))),
            bindings([binding("X", tel_car), binding("Y", ref_car)]),
            uses([
              proof(
                goal(broader(tel_car, ref_car)), by(rule("alignment-demo.pl", clause(16))),
                bindings([binding("X", tel_car), binding("Y", ref_car)]),
                uses([
                  proof(goal(assertedBroader(tel_car, ref_car)), by(fact("alignment-demo.pl", clause(12))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(neq(tel_car, ref_car)), by(builtin(neq, 2)))
    ])
  )
).

rollsUpTo(tel_heavy_vehicle, ref_car).
why(
  rollsUpTo(tel_heavy_vehicle, ref_car),
  proof(
    goal(rollsUpTo(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(25))),
    bindings([binding("X", tel_heavy_vehicle)]),
    uses([
      proof(
        goal(narrowerOrEqualOf(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(24))),
        bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broaderTransitive(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(19))),
            bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
            uses([
              proof(
                goal(broader(tel_heavy_vehicle, ref_car)), by(rule("alignment-demo.pl", clause(16))),
                bindings([binding("X", tel_heavy_vehicle), binding("Y", ref_car)]),
                uses([
                  proof(goal(assertedBroader(tel_heavy_vehicle, ref_car)), by(fact("alignment-demo.pl", clause(13))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(neq(tel_heavy_vehicle, ref_car)), by(builtin(neq, 2)))
    ])
  )
).

rollsUpTo(anpr_vehicle_with_plate, ref_car).
why(
  rollsUpTo(anpr_vehicle_with_plate, ref_car),
  proof(
    goal(rollsUpTo(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(25))),
    bindings([binding("X", anpr_vehicle_with_plate)]),
    uses([
      proof(
        goal(narrowerOrEqualOf(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(24))),
        bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
            bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
            uses([
              proof(
                goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
                bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
                uses([
                  proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(neq(anpr_vehicle_with_plate, ref_car)), by(builtin(neq, 2)))
    ])
  )
).

rollsUpTo(anpr_passenger_car, ref_car).
why(
  rollsUpTo(anpr_passenger_car, ref_car),
  proof(
    goal(rollsUpTo(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(25))),
    bindings([binding("X", anpr_passenger_car)]),
    uses([
      proof(
        goal(narrowerOrEqualOf(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(24))),
        bindings([binding("X", anpr_passenger_car), binding("Y", ref_car)]),
        uses([
          proof(
            goal(broaderTransitive(anpr_passenger_car, ref_car)), by(rule("alignment-demo.pl", clause(20))),
            bindings([binding("X", anpr_passenger_car), binding("Z", ref_car), binding("Y", anpr_vehicle_with_plate)]),
            uses([
              proof(
                goal(broader(anpr_passenger_car, anpr_vehicle_with_plate)), by(rule("alignment-demo.pl", clause(17))),
                bindings([binding("X", anpr_passenger_car), binding("Y", anpr_vehicle_with_plate)]),
                uses([
                  proof(goal(assertedNarrower(anpr_vehicle_with_plate, anpr_passenger_car)), by(fact("alignment-demo.pl", clause(15))))
                ])
              ),
              proof(
                goal(broaderTransitive(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(19))),
                bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
                uses([
                  proof(
                    goal(broader(anpr_vehicle_with_plate, ref_car)), by(rule("alignment-demo.pl", clause(16))),
                    bindings([binding("X", anpr_vehicle_with_plate), binding("Y", ref_car)]),
                    uses([
                      proof(goal(assertedBroader(anpr_vehicle_with_plate, ref_car)), by(fact("alignment-demo.pl", clause(14))))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(neq(anpr_passenger_car, ref_car)), by(builtin(neq, 2)))
    ])
  )
).

