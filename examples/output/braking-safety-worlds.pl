safeInWorld(city_dry, w0).
why(
  safeInWorld(city_dry, w0),
  proof(
    goal(safeInWorld(city_dry, w0)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_dry), binding("World", w0)]),
    uses([
      proof(
        goal(safe_in_world(city_dry, w0)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_dry), binding("World", w0), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 26.222066326530612)]),
        uses([
          proof(
            goal(scenario(city_dry, 13.9, 0.8, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(5)))
          ),
          proof(
            goal(stop_distance(city_dry, w0, 26.222066326530612)),
            by(rule("braking-safety-worlds.pl", clause(13))),
            bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(mul(13.9, 1.0, 13.9)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.8, 2.0, 1.6000000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                by(builtin(div, 3))
              ),
              proof(
                goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(le(26.222066326530612, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_dry, w1).
why(
  safeInWorld(city_dry, w1),
  proof(
    goal(safeInWorld(city_dry, w1)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_dry), binding("World", w1)]),
    uses([
      proof(
        goal(safe_in_world(city_dry, w1)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_dry), binding("World", w1), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 12.075625)]),
        uses([
          proof(
            goal(scenario(city_dry, 13.9, 0.8, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(5)))
          ),
          proof(
            goal(stop_distance(city_dry, w1, 12.075625)),
            by(rule("braking-safety-worlds.pl", clause(14))),
            bindings([binding("Scenario", city_dry), binding("Distance", 12.075625), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.8, 2.0, 1.6000000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(1.6000000000000001, 10.0, 16.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 16.0, 12.075625)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(12.075625, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_dry, w2).
why(
  safeInWorld(city_dry, w2),
  proof(
    goal(safeInWorld(city_dry, w2)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_dry), binding("World", w2)]),
    uses([
      proof(
        goal(safe_in_world(city_dry, w2)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_dry), binding("World", w2), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
        uses([
          proof(
            goal(scenario(city_dry, 13.9, 0.8, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(5)))
          ),
          proof(
            goal(stop_distance(city_dry, w2, 13.800714285714287)),
            by(rule("braking-safety-worlds.pl", clause(15))),
            bindings([binding("Scenario", city_dry), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(13.800714285714287, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_dry, w3).
why(
  safeInWorld(city_dry, w3),
  proof(
    goal(safeInWorld(city_dry, w3)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_dry), binding("World", w3)]),
    uses([
      proof(
        goal(safe_in_world(city_dry, w3)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_dry), binding("World", w3), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 39.33309948979592)]),
        uses([
          proof(
            goal(scenario(city_dry, 13.9, 0.8, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(5)))
          ),
          proof(
            goal(stop_distance(city_dry, w3, 39.33309948979592)),
            by(rule("braking-safety-worlds.pl", clause(16))),
            bindings([binding("Scenario", city_dry), binding("Distance", 39.33309948979592), binding("W0Distance", 26.222066326530612)]),
            uses([
              proof(
                goal(stop_distance(city_dry, w0, 26.222066326530612)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(mul(26.222066326530612, 1.5, 39.33309948979592)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(39.33309948979592, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(highway_dry_short_gap, w1).
why(
  safeInWorld(highway_dry_short_gap, w1),
  proof(
    goal(safeInWorld(highway_dry_short_gap, w1)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", highway_dry_short_gap), binding("World", w1)]),
    uses([
      proof(
        goal(safe_in_world(highway_dry_short_gap, w1)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", highway_dry_short_gap), binding("World", w1), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 48.302500000000002)]),
        uses([
          proof(
            goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
            by(fact("braking-safety-worlds.pl", clause(6)))
          ),
          proof(
            goal(stop_distance(highway_dry_short_gap, w1, 48.302500000000002)),
            by(rule("braking-safety-worlds.pl", clause(14))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 48.302500000000002), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(pow(27.8, 2.0, 772.84000000000003)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.8, 2.0, 1.6000000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(1.6000000000000001, 10.0, 16.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(772.84000000000003, 16.0, 48.302500000000002)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(48.302500000000002, 60.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(highway_dry_short_gap, w2).
why(
  safeInWorld(highway_dry_short_gap, w2),
  proof(
    goal(safeInWorld(highway_dry_short_gap, w2)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", highway_dry_short_gap), binding("World", w2)]),
    uses([
      proof(
        goal(safe_in_world(highway_dry_short_gap, w2)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", highway_dry_short_gap), binding("World", w2), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 55.202857142857148)]),
        uses([
          proof(
            goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
            by(fact("braking-safety-worlds.pl", clause(6)))
          ),
          proof(
            goal(stop_distance(highway_dry_short_gap, w2, 55.202857142857148)),
            by(rule("braking-safety-worlds.pl", clause(15))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 55.202857142857148), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(pow(27.8, 2.0, 772.84000000000003)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(div(772.84000000000003, 14.0, 55.202857142857148)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(55.202857142857148, 60.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_wet, w0).
why(
  safeInWorld(city_wet, w0),
  proof(
    goal(safeInWorld(city_wet, w0)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_wet), binding("World", w0)]),
    uses([
      proof(
        goal(safe_in_world(city_wet, w0)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_wet), binding("World", w0), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 38.544132653061226)]),
        uses([
          proof(
            goal(scenario(city_wet, 13.9, 0.4, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(7)))
          ),
          proof(
            goal(stop_distance(city_wet, w0, 38.544132653061226)),
            by(rule("braking-safety-worlds.pl", clause(13))),
            bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(mul(13.9, 1.0, 13.9)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.4, 2.0, 0.80000000000000004)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                by(builtin(div, 3))
              ),
              proof(
                goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(le(38.544132653061226, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_wet, w1).
why(
  safeInWorld(city_wet, w1),
  proof(
    goal(safeInWorld(city_wet, w1)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_wet), binding("World", w1)]),
    uses([
      proof(
        goal(safe_in_world(city_wet, w1)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_wet), binding("World", w1), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 24.151250000000001)]),
        uses([
          proof(
            goal(scenario(city_wet, 13.9, 0.4, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(7)))
          ),
          proof(
            goal(stop_distance(city_wet, w1, 24.151250000000001)),
            by(rule("braking-safety-worlds.pl", clause(14))),
            bindings([binding("Scenario", city_wet), binding("Distance", 24.151250000000001), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 8.0)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.4, 2.0, 0.80000000000000004)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(0.80000000000000004, 10.0, 8.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 8.0, 24.151250000000001)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(24.151250000000001, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_wet, w2).
why(
  safeInWorld(city_wet, w2),
  proof(
    goal(safeInWorld(city_wet, w2)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_wet), binding("World", w2)]),
    uses([
      proof(
        goal(safe_in_world(city_wet, w2)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_wet), binding("World", w2), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
        uses([
          proof(
            goal(scenario(city_wet, 13.9, 0.4, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(7)))
          ),
          proof(
            goal(stop_distance(city_wet, w2, 13.800714285714287)),
            by(rule("braking-safety-worlds.pl", clause(15))),
            bindings([binding("Scenario", city_wet), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(13.800714285714287, 40.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_ice, w2).
why(
  safeInWorld(city_ice, w2),
  proof(
    goal(safeInWorld(city_ice, w2)),
    by(rule("braking-safety-worlds.pl", clause(20))),
    bindings([binding("Scenario", city_ice), binding("World", w2)]),
    uses([
      proof(
        goal(safe_in_world(city_ice, w2)),
        by(rule("braking-safety-worlds.pl", clause(17))),
        bindings([binding("Scenario", city_ice), binding("World", w2), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 13.800714285714287)]),
        uses([
          proof(
            goal(scenario(city_ice, 13.9, 0.2, 30.0)),
            by(fact("braking-safety-worlds.pl", clause(8)))
          ),
          proof(
            goal(stop_distance(city_ice, w2, 13.800714285714287)),
            by(rule("braking-safety-worlds.pl", clause(15))),
            bindings([binding("Scenario", city_ice), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(le(13.800714285714287, 30.0)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(highway_dry_short_gap, w0).
why(
  riskyInWorld(highway_dry_short_gap, w0),
  proof(
    goal(riskyInWorld(highway_dry_short_gap, w0)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", highway_dry_short_gap), binding("World", w0)]),
    uses([
      proof(
        goal(risky_in_world(highway_dry_short_gap, w0)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", highway_dry_short_gap), binding("World", w0), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 77.088265306122452)]),
        uses([
          proof(
            goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
            by(fact("braking-safety-worlds.pl", clause(6)))
          ),
          proof(
            goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
            by(rule("braking-safety-worlds.pl", clause(13))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(mul(27.8, 1.0, 27.800000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(pow(27.8, 2.0, 772.84000000000003)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.8, 2.0, 1.6000000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                by(builtin(div, 3))
              ),
              proof(
                goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(gt(77.088265306122452, 60.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(highway_dry_short_gap, w3).
why(
  riskyInWorld(highway_dry_short_gap, w3),
  proof(
    goal(riskyInWorld(highway_dry_short_gap, w3)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", highway_dry_short_gap), binding("World", w3)]),
    uses([
      proof(
        goal(risky_in_world(highway_dry_short_gap, w3)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", highway_dry_short_gap), binding("World", w3), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 115.63239795918368)]),
        uses([
          proof(
            goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
            by(fact("braking-safety-worlds.pl", clause(6)))
          ),
          proof(
            goal(stop_distance(highway_dry_short_gap, w3, 115.63239795918368)),
            by(rule("braking-safety-worlds.pl", clause(16))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 115.63239795918368), binding("W0Distance", 77.088265306122452)]),
            uses([
              proof(
                goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(mul(27.8, 1.0, 27.800000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(mul(77.088265306122452, 1.5, 115.63239795918368)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(115.63239795918368, 60.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(city_wet, w3).
why(
  riskyInWorld(city_wet, w3),
  proof(
    goal(riskyInWorld(city_wet, w3)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", city_wet), binding("World", w3)]),
    uses([
      proof(
        goal(risky_in_world(city_wet, w3)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", city_wet), binding("World", w3), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 57.816198979591839)]),
        uses([
          proof(
            goal(scenario(city_wet, 13.9, 0.4, 40.0)),
            by(fact("braking-safety-worlds.pl", clause(7)))
          ),
          proof(
            goal(stop_distance(city_wet, w3, 57.816198979591839)),
            by(rule("braking-safety-worlds.pl", clause(16))),
            bindings([binding("Scenario", city_wet), binding("Distance", 57.816198979591839), binding("W0Distance", 38.544132653061226)]),
            uses([
              proof(
                goal(stop_distance(city_wet, w0, 38.544132653061226)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.4, 2.0, 0.80000000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(mul(38.544132653061226, 1.5, 57.816198979591839)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(57.816198979591839, 40.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(city_ice, w0).
why(
  riskyInWorld(city_ice, w0),
  proof(
    goal(riskyInWorld(city_ice, w0)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", city_ice), binding("World", w0)]),
    uses([
      proof(
        goal(risky_in_world(city_ice, w0)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", city_ice), binding("World", w0), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 63.188265306122446)]),
        uses([
          proof(
            goal(scenario(city_ice, 13.9, 0.2, 30.0)),
            by(fact("braking-safety-worlds.pl", clause(8)))
          ),
          proof(
            goal(stop_distance(city_ice, w0, 63.188265306122446)),
            by(rule("braking-safety-worlds.pl", clause(13))),
            bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(mul(13.9, 1.0, 13.9)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.2, 2.0, 0.40000000000000002)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                by(builtin(div, 3))
              ),
              proof(
                goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(gt(63.188265306122446, 30.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(city_ice, w1).
why(
  riskyInWorld(city_ice, w1),
  proof(
    goal(riskyInWorld(city_ice, w1)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", city_ice), binding("World", w1)]),
    uses([
      proof(
        goal(risky_in_world(city_ice, w1)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", city_ice), binding("World", w1), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 48.302500000000002)]),
        uses([
          proof(
            goal(scenario(city_ice, 13.9, 0.2, 30.0)),
            by(fact("braking-safety-worlds.pl", clause(8)))
          ),
          proof(
            goal(stop_distance(city_ice, w1, 48.302500000000002)),
            by(rule("braking-safety-worlds.pl", clause(14))),
            bindings([binding("Scenario", city_ice), binding("Distance", 48.302500000000002), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 4.0)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(pow(13.9, 2.0, 193.21000000000001)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(0.2, 2.0, 0.40000000000000002)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(0.40000000000000002, 10.0, 4.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(193.21000000000001, 4.0, 48.302500000000002)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(gt(48.302500000000002, 30.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(city_ice, w3).
why(
  riskyInWorld(city_ice, w3),
  proof(
    goal(riskyInWorld(city_ice, w3)),
    by(rule("braking-safety-worlds.pl", clause(21))),
    bindings([binding("Scenario", city_ice), binding("World", w3)]),
    uses([
      proof(
        goal(risky_in_world(city_ice, w3)),
        by(rule("braking-safety-worlds.pl", clause(18))),
        bindings([binding("Scenario", city_ice), binding("World", w3), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 94.782397959183669)]),
        uses([
          proof(
            goal(scenario(city_ice, 13.9, 0.2, 30.0)),
            by(fact("braking-safety-worlds.pl", clause(8)))
          ),
          proof(
            goal(stop_distance(city_ice, w3, 94.782397959183669)),
            by(rule("braking-safety-worlds.pl", clause(16))),
            bindings([binding("Scenario", city_ice), binding("Distance", 94.782397959183669), binding("W0Distance", 63.188265306122446)]),
            uses([
              proof(
                goal(stop_distance(city_ice, w0, 63.188265306122446)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.2, 2.0, 0.40000000000000002)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(mul(63.188265306122446, 1.5, 94.782397959183669)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(94.782397959183669, 30.0)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

status(braking_safety_worlds, expected_world_pattern).
why(
  status(braking_safety_worlds, expected_world_pattern),
  proof(
    goal(status(braking_safety_worlds, expected_world_pattern)),
    by(rule("braking-safety-worlds.pl", clause(22))),
    uses([
      proof(
        goal(pattern_matches(report)),
        by(rule("braking-safety-worlds.pl", clause(19))),
        uses([
          proof(
            goal(safe_in_world(city_dry, w0)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w0), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 26.222066326530612)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w0, 26.222066326530612)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(le(26.222066326530612, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w1), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 12.075625)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w1, 12.075625)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_dry), binding("Distance", 12.075625), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 10.0, 16.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 16.0, 12.075625)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(12.075625, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w2), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_dry), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w3)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w3), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 39.33309948979592)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w3, 39.33309948979592)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_dry), binding("Distance", 39.33309948979592), binding("W0Distance", 26.222066326530612)]),
                uses([
                  proof(
                    goal(stop_distance(city_dry, w0, 26.222066326530612)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
                    uses([
                      proof(
                        goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                        by(fact("braking-safety-worlds.pl", clause(5)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.8, 2.0, 1.6000000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(26.222066326530612, 1.5, 39.33309948979592)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(le(39.33309948979592, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(highway_dry_short_gap, w0)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w0), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 77.088265306122452)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(mul(27.8, 1.0, 27.800000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(gt(77.088265306122452, 60.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(highway_dry_short_gap, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w3), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 115.63239795918368)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w3, 115.63239795918368)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 115.63239795918368), binding("W0Distance", 77.088265306122452)]),
                uses([
                  proof(
                    goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
                    uses([
                      proof(
                        goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                        by(fact("braking-safety-worlds.pl", clause(6)))
                      ),
                      proof(
                        goal(mul(27.8, 1.0, 27.800000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(27.8, 2.0, 772.84000000000003)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.8, 2.0, 1.6000000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(77.088265306122452, 1.5, 115.63239795918368)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(115.63239795918368, 60.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(highway_dry_short_gap, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w1), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 48.302500000000002)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w1, 48.302500000000002)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 48.302500000000002), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 10.0, 16.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 16.0, 48.302500000000002)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(48.302500000000002, 60.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(highway_dry_short_gap, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w2), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 55.202857142857148)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w2, 55.202857142857148)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 55.202857142857148), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 14.0, 55.202857142857148)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(55.202857142857148, 60.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w0)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w0), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 38.544132653061226)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w0, 38.544132653061226)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.4, 2.0, 0.80000000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(le(38.544132653061226, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w1), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 24.151250000000001)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w1, 24.151250000000001)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_wet), binding("Distance", 24.151250000000001), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 8.0)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.4, 2.0, 0.80000000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.80000000000000004, 10.0, 8.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 8.0, 24.151250000000001)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(24.151250000000001, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w2), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_wet), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_wet, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_wet), binding("World", w3), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 57.816198979591839)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w3, 57.816198979591839)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_wet), binding("Distance", 57.816198979591839), binding("W0Distance", 38.544132653061226)]),
                uses([
                  proof(
                    goal(stop_distance(city_wet, w0, 38.544132653061226)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
                    uses([
                      proof(
                        goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                        by(fact("braking-safety-worlds.pl", clause(7)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.4, 2.0, 0.80000000000000004)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(38.544132653061226, 1.5, 57.816198979591839)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(57.816198979591839, 40.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w0)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w0), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 63.188265306122446)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w0, 63.188265306122446)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.2, 2.0, 0.40000000000000002)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(gt(63.188265306122446, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w1)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w1), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 48.302500000000002)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w1, 48.302500000000002)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_ice), binding("Distance", 48.302500000000002), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 4.0)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.2, 2.0, 0.40000000000000002)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.40000000000000002, 10.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 4.0, 48.302500000000002)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(gt(48.302500000000002, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w3), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 94.782397959183669)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w3, 94.782397959183669)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_ice), binding("Distance", 94.782397959183669), binding("W0Distance", 63.188265306122446)]),
                uses([
                  proof(
                    goal(stop_distance(city_ice, w0, 63.188265306122446)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
                    uses([
                      proof(
                        goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                        by(fact("braking-safety-worlds.pl", clause(8)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.2, 2.0, 0.40000000000000002)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(63.188265306122446, 1.5, 94.782397959183669)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(94.782397959183669, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_ice, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_ice), binding("World", w2), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_ice), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 30.0)),
                by(builtin(le, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

reason(braking_safety_worlds, "simplified and naive worlds can be optimistic while the cautious world tightens the reference model").
why(
  reason(braking_safety_worlds, "simplified and naive worlds can be optimistic while the cautious world tightens the reference model"),
  proof(
    goal(reason(braking_safety_worlds, "simplified and naive worlds can be optimistic while the cautious world tightens the reference model")),
    by(rule("braking-safety-worlds.pl", clause(23))),
    uses([
      proof(
        goal(pattern_matches(report)),
        by(rule("braking-safety-worlds.pl", clause(19))),
        uses([
          proof(
            goal(safe_in_world(city_dry, w0)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w0), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 26.222066326530612)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w0, 26.222066326530612)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(le(26.222066326530612, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w1), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 12.075625)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w1, 12.075625)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_dry), binding("Distance", 12.075625), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 10.0, 16.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 16.0, 12.075625)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(12.075625, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w2), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_dry), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(5)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_dry, w3)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_dry), binding("World", w3), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Distance", 39.33309948979592)]),
            uses([
              proof(
                goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(5)))
              ),
              proof(
                goal(stop_distance(city_dry, w3, 39.33309948979592)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_dry), binding("Distance", 39.33309948979592), binding("W0Distance", 26.222066326530612)]),
                uses([
                  proof(
                    goal(stop_distance(city_dry, w0, 26.222066326530612)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_dry), binding("Distance", 26.222066326530612), binding("V", 13.9), binding("Mu", 0.8), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 12.322066326530612)]),
                    uses([
                      proof(
                        goal(scenario(city_dry, 13.9, 0.8, 40.0)),
                        by(fact("braking-safety-worlds.pl", clause(5)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.8, 2.0, 1.6000000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 15.680000000000001, 12.322066326530612)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 12.322066326530612, 26.222066326530612)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(26.222066326530612, 1.5, 39.33309948979592)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(le(39.33309948979592, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(highway_dry_short_gap, w0)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w0), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 77.088265306122452)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(mul(27.8, 1.0, 27.800000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(gt(77.088265306122452, 60.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(highway_dry_short_gap, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w3), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 115.63239795918368)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w3, 115.63239795918368)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 115.63239795918368), binding("W0Distance", 77.088265306122452)]),
                uses([
                  proof(
                    goal(stop_distance(highway_dry_short_gap, w0, 77.088265306122452)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 77.088265306122452), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Reaction", 27.800000000000001), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 15.680000000000001), binding("Braking", 49.288265306122447)]),
                    uses([
                      proof(
                        goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                        by(fact("braking-safety-worlds.pl", clause(6)))
                      ),
                      proof(
                        goal(mul(27.8, 1.0, 27.800000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(27.8, 2.0, 772.84000000000003)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.8, 2.0, 1.6000000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(1.6000000000000001, 9.8, 15.680000000000001)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(772.84000000000003, 15.680000000000001, 49.288265306122447)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(27.800000000000001, 49.288265306122447, 77.088265306122452)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(77.088265306122452, 1.5, 115.63239795918368)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(115.63239795918368, 60.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(highway_dry_short_gap, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w1), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 48.302500000000002)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w1, 48.302500000000002)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 48.302500000000002), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003), binding("M2", 1.6000000000000001), binding("Denom", 16.0)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.8, 2.0, 1.6000000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(1.6000000000000001, 10.0, 16.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 16.0, 48.302500000000002)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(48.302500000000002, 60.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(highway_dry_short_gap, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", highway_dry_short_gap), binding("World", w2), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("Distance", 55.202857142857148)]),
            uses([
              proof(
                goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                by(fact("braking-safety-worlds.pl", clause(6)))
              ),
              proof(
                goal(stop_distance(highway_dry_short_gap, w2, 55.202857142857148)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", highway_dry_short_gap), binding("Distance", 55.202857142857148), binding("V", 27.8), binding("Mu", 0.8), binding("Avail", 60.0), binding("V2", 772.84000000000003)]),
                uses([
                  proof(
                    goal(scenario(highway_dry_short_gap, 27.8, 0.8, 60.0)),
                    by(fact("braking-safety-worlds.pl", clause(6)))
                  ),
                  proof(
                    goal(pow(27.8, 2.0, 772.84000000000003)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(772.84000000000003, 14.0, 55.202857142857148)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(55.202857142857148, 60.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w0)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w0), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 38.544132653061226)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w0, 38.544132653061226)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.4, 2.0, 0.80000000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(le(38.544132653061226, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w1)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w1), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 24.151250000000001)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w1, 24.151250000000001)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_wet), binding("Distance", 24.151250000000001), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 8.0)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.4, 2.0, 0.80000000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.80000000000000004, 10.0, 8.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 8.0, 24.151250000000001)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(24.151250000000001, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_wet, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_wet), binding("World", w2), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_wet), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                    by(fact("braking-safety-worlds.pl", clause(7)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 40.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_wet, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_wet), binding("World", w3), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Distance", 57.816198979591839)]),
            uses([
              proof(
                goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                by(fact("braking-safety-worlds.pl", clause(7)))
              ),
              proof(
                goal(stop_distance(city_wet, w3, 57.816198979591839)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_wet), binding("Distance", 57.816198979591839), binding("W0Distance", 38.544132653061226)]),
                uses([
                  proof(
                    goal(stop_distance(city_wet, w0, 38.544132653061226)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_wet), binding("Distance", 38.544132653061226), binding("V", 13.9), binding("Mu", 0.4), binding("Avail", 40.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.80000000000000004), binding("Denom", 7.8400000000000007), binding("Braking", 24.644132653061224)]),
                    uses([
                      proof(
                        goal(scenario(city_wet, 13.9, 0.4, 40.0)),
                        by(fact("braking-safety-worlds.pl", clause(7)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.4, 2.0, 0.80000000000000004)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(0.80000000000000004, 9.8, 7.8400000000000007)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 7.8400000000000007, 24.644132653061224)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 24.644132653061224, 38.544132653061226)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(38.544132653061226, 1.5, 57.816198979591839)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(57.816198979591839, 40.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w0)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w0), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 63.188265306122446)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w0, 63.188265306122446)),
                by(rule("braking-safety-worlds.pl", clause(13))),
                bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(mul(13.9, 1.0, 13.9)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.2, 2.0, 0.40000000000000002)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(gt(63.188265306122446, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w1)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w1), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 48.302500000000002)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w1, 48.302500000000002)),
                by(rule("braking-safety-worlds.pl", clause(14))),
                bindings([binding("Scenario", city_ice), binding("Distance", 48.302500000000002), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 4.0)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(0.2, 2.0, 0.40000000000000002)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(0.40000000000000002, 10.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 4.0, 48.302500000000002)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(gt(48.302500000000002, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(risky_in_world(city_ice, w3)),
            by(rule("braking-safety-worlds.pl", clause(18))),
            bindings([binding("Scenario", city_ice), binding("World", w3), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 94.782397959183669)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w3, 94.782397959183669)),
                by(rule("braking-safety-worlds.pl", clause(16))),
                bindings([binding("Scenario", city_ice), binding("Distance", 94.782397959183669), binding("W0Distance", 63.188265306122446)]),
                uses([
                  proof(
                    goal(stop_distance(city_ice, w0, 63.188265306122446)),
                    by(rule("braking-safety-worlds.pl", clause(13))),
                    bindings([binding("Scenario", city_ice), binding("Distance", 63.188265306122446), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Reaction", 13.9), binding("V2", 193.21000000000001), binding("M2", 0.40000000000000002), binding("Denom", 3.9200000000000004), binding("Braking", 49.288265306122447)]),
                    uses([
                      proof(
                        goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                        by(fact("braking-safety-worlds.pl", clause(8)))
                      ),
                      proof(
                        goal(mul(13.9, 1.0, 13.9)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(pow(13.9, 2.0, 193.21000000000001)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(mul(0.2, 2.0, 0.40000000000000002)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mul(0.40000000000000002, 9.8, 3.9200000000000004)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(div(193.21000000000001, 3.9200000000000004, 49.288265306122447)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(add(13.9, 49.288265306122447, 63.188265306122446)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(63.188265306122446, 1.5, 94.782397959183669)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(gt(94.782397959183669, 30.0)),
                by(builtin(gt, 2))
              )
            ])
          ),
          proof(
            goal(safe_in_world(city_ice, w2)),
            by(rule("braking-safety-worlds.pl", clause(17))),
            bindings([binding("Scenario", city_ice), binding("World", w2), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("Distance", 13.800714285714287)]),
            uses([
              proof(
                goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                by(fact("braking-safety-worlds.pl", clause(8)))
              ),
              proof(
                goal(stop_distance(city_ice, w2, 13.800714285714287)),
                by(rule("braking-safety-worlds.pl", clause(15))),
                bindings([binding("Scenario", city_ice), binding("Distance", 13.800714285714287), binding("V", 13.9), binding("Mu", 0.2), binding("Avail", 30.0), binding("V2", 193.21000000000001)]),
                uses([
                  proof(
                    goal(scenario(city_ice, 13.9, 0.2, 30.0)),
                    by(fact("braking-safety-worlds.pl", clause(8)))
                  ),
                  proof(
                    goal(pow(13.9, 2.0, 193.21000000000001)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(div(193.21000000000001, 14.0, 13.800714285714287)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(le(13.800714285714287, 30.0)),
                by(builtin(le, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

