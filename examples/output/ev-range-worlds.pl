safeInWorld(city_errand, w1).
why(
  safeInWorld(city_errand, w1),
  proof(
    goal(safeInWorld(city_errand, w1)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", city_errand), binding("W", w1)]),
    uses([
      proof(
        goal(safe_in_world(city_errand, w1)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", city_errand), binding("W", w1), binding("__anon39", 40), binding("__anon40", 45), binding("__anon41", 20), binding("__anon42", 100), binding("Battery", 30), binding("__anon43", 0.18), binding("Required", 7.1999999999999993)]),
        uses([
          proof(
            goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
            by(fact("ev-range-worlds.pl", clause(9)))
          ),
          proof(
            goal(required_energy(city_errand, w1, 7.1999999999999993)),
            by(rule("ev-range-worlds.pl", clause(21))),
            bindings([binding("T", city_errand), binding("E", 7.1999999999999993)]),
            uses([
              proof(
                goal(base_energy(city_errand, 7.1999999999999993)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("D", 40), binding("__anon35", 45), binding("__anon36", 20), binding("__anon37", 100), binding("__anon38", 30), binding("B", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(mul(40, 0.18, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(le(7.1999999999999993, 30)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_errand, w2).
why(
  safeInWorld(city_errand, w2),
  proof(
    goal(safeInWorld(city_errand, w2)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", city_errand), binding("W", w2)]),
    uses([
      proof(
        goal(safe_in_world(city_errand, w2)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", city_errand), binding("W", w2), binding("__anon39", 40), binding("__anon40", 45), binding("__anon41", 20), binding("__anon42", 100), binding("Battery", 30), binding("__anon43", 0.18), binding("Required", 7.1999999999999993)]),
        uses([
          proof(
            goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
            by(fact("ev-range-worlds.pl", clause(9)))
          ),
          proof(
            goal(required_energy(city_errand, w2, 7.1999999999999993)),
            by(rule("ev-range-worlds.pl", clause(22))),
            bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("Base", 7.1999999999999993), binding("SF", 1.00)]),
            uses([
              proof(
                goal(base_energy(city_errand, 7.1999999999999993)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("D", 40), binding("__anon35", 45), binding("__anon36", 20), binding("__anon37", 100), binding("__anon38", 30), binding("B", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(mul(40, 0.18, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(city_errand, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", city_errand), binding("__anon5", 40), binding("S", 45), binding("__anon6", 20), binding("__anon7", 100), binding("__anon8", 30), binding("__anon9", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(le(45, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(7.1999999999999993, 30)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_errand, w0).
why(
  safeInWorld(city_errand, w0),
  proof(
    goal(safeInWorld(city_errand, w0)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", city_errand), binding("W", w0)]),
    uses([
      proof(
        goal(safe_in_world(city_errand, w0)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", city_errand), binding("W", w0), binding("__anon39", 40), binding("__anon40", 45), binding("__anon41", 20), binding("__anon42", 100), binding("Battery", 30), binding("__anon43", 0.18), binding("Required", 7.1999999999999993)]),
        uses([
          proof(
            goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
            by(fact("ev-range-worlds.pl", clause(9)))
          ),
          proof(
            goal(required_energy(city_errand, w0, 7.1999999999999993)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("Base", 7.1999999999999993), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.00), binding("A", 7.1999999999999993), binding("B", 7.1999999999999993)]),
            uses([
              proof(
                goal(base_energy(city_errand, 7.1999999999999993)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("D", 40), binding("__anon35", 45), binding("__anon36", 20), binding("__anon37", 100), binding("__anon38", 30), binding("B", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(mul(40, 0.18, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(city_errand, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", city_errand), binding("__anon5", 40), binding("S", 45), binding("__anon6", 20), binding("__anon7", 100), binding("__anon8", 30), binding("__anon9", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(le(45, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(city_errand, 1.00)),
                by(rule("ev-range-worlds.pl", clause(16))),
                bindings([binding("T", city_errand), binding("__anon15", 40), binding("__anon16", 45), binding("Temp", 20), binding("__anon17", 100), binding("__anon18", 30), binding("__anon19", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(ge(20, 0)),
                    by(builtin(ge, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(city_errand, 1.00)),
                by(rule("ev-range-worlds.pl", clause(19))),
                bindings([binding("T", city_errand), binding("__anon30", 40), binding("__anon31", 45), binding("__anon32", 20), binding("P", 100), binding("__anon33", 30), binding("__anon34", 0.18)]),
                uses([
                  proof(
                    goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                    by(fact("ev-range-worlds.pl", clause(9)))
                  ),
                  proof(
                    goal(le(100, 250)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(7.1999999999999993, 30)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(city_errand, w3).
why(
  safeInWorld(city_errand, w3),
  proof(
    goal(safeInWorld(city_errand, w3)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", city_errand), binding("W", w3)]),
    uses([
      proof(
        goal(safe_in_world(city_errand, w3)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", city_errand), binding("W", w3), binding("__anon39", 40), binding("__anon40", 45), binding("__anon41", 20), binding("__anon42", 100), binding("Battery", 30), binding("__anon43", 0.18), binding("Required", 9.3599999999999994)]),
        uses([
          proof(
            goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
            by(fact("ev-range-worlds.pl", clause(9)))
          ),
          proof(
            goal(required_energy(city_errand, w3, 9.3599999999999994)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", city_errand), binding("E", 9.3599999999999994), binding("W0", 7.1999999999999993)]),
            uses([
              proof(
                goal(required_energy(city_errand, w0, 7.1999999999999993)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("Base", 7.1999999999999993), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.00), binding("A", 7.1999999999999993), binding("B", 7.1999999999999993)]),
                uses([
                  proof(
                    goal(base_energy(city_errand, 7.1999999999999993)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("D", 40), binding("__anon35", 45), binding("__anon36", 20), binding("__anon37", 100), binding("__anon38", 30), binding("B", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(mul(40, 0.18, 7.1999999999999993)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", city_errand), binding("__anon5", 40), binding("S", 45), binding("__anon6", 20), binding("__anon7", 100), binding("__anon8", 30), binding("__anon9", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(le(45, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(16))),
                    bindings([binding("T", city_errand), binding("__anon15", 40), binding("__anon16", 45), binding("Temp", 20), binding("__anon17", 100), binding("__anon18", 30), binding("__anon19", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(ge(20, 0)),
                        by(builtin(ge, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(19))),
                    bindings([binding("T", city_errand), binding("__anon30", 40), binding("__anon31", 45), binding("__anon32", 20), binding("P", 100), binding("__anon33", 30), binding("__anon34", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(le(100, 250)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(7.1999999999999993, 1.30, 9.3599999999999994)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(9.3599999999999994, 30)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(winter_highway, w1).
why(
  safeInWorld(winter_highway, w1),
  proof(
    goal(safeInWorld(winter_highway, w1)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", winter_highway), binding("W", w1)]),
    uses([
      proof(
        goal(safe_in_world(winter_highway, w1)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", winter_highway), binding("W", w1), binding("__anon39", 260), binding("__anon40", 115), binding("__anon41", -5), binding("__anon42", 400), binding("Battery", 60), binding("__anon43", 0.20), binding("Required", 52.0)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w1, 52.0)),
            by(rule("ev-range-worlds.pl", clause(21))),
            bindings([binding("T", winter_highway), binding("E", 52.0)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(le(52.0, 60)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(heavy_delivery, w1).
why(
  safeInWorld(heavy_delivery, w1),
  proof(
    goal(safeInWorld(heavy_delivery, w1)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", heavy_delivery), binding("W", w1)]),
    uses([
      proof(
        goal(safe_in_world(heavy_delivery, w1)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", heavy_delivery), binding("W", w1), binding("__anon39", 180), binding("__anon40", 80), binding("__anon41", 15), binding("__anon42", 700), binding("Battery", 55), binding("__anon43", 0.22), binding("Required", 39.600000000000001)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w1, 39.600000000000001)),
            by(rule("ev-range-worlds.pl", clause(21))),
            bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001)]),
            uses([
              proof(
                goal(base_energy(heavy_delivery, 39.600000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(mul(180, 0.22, 39.600000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(le(39.600000000000001, 55)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(heavy_delivery, w2).
why(
  safeInWorld(heavy_delivery, w2),
  proof(
    goal(safeInWorld(heavy_delivery, w2)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", heavy_delivery), binding("W", w2)]),
    uses([
      proof(
        goal(safe_in_world(heavy_delivery, w2)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", heavy_delivery), binding("W", w2), binding("__anon39", 180), binding("__anon40", 80), binding("__anon41", 15), binding("__anon42", 700), binding("Battery", 55), binding("__anon43", 0.22), binding("Required", 39.600000000000001)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w2, 39.600000000000001)),
            by(rule("ev-range-worlds.pl", clause(22))),
            bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("Base", 39.600000000000001), binding("SF", 1.00)]),
            uses([
              proof(
                goal(base_energy(heavy_delivery, 39.600000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(mul(180, 0.22, 39.600000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(heavy_delivery, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(le(80, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(39.600000000000001, 55)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(heavy_delivery, w0).
why(
  safeInWorld(heavy_delivery, w0),
  proof(
    goal(safeInWorld(heavy_delivery, w0)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", heavy_delivery), binding("W", w0)]),
    uses([
      proof(
        goal(safe_in_world(heavy_delivery, w0)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", heavy_delivery), binding("W", w0), binding("__anon39", 180), binding("__anon40", 80), binding("__anon41", 15), binding("__anon42", 700), binding("Battery", 55), binding("__anon43", 0.22), binding("Required", 45.539999999999999)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w0, 45.539999999999999)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", heavy_delivery), binding("E", 45.539999999999999), binding("Base", 39.600000000000001), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.15), binding("A", 39.600000000000001), binding("B", 39.600000000000001)]),
            uses([
              proof(
                goal(base_energy(heavy_delivery, 39.600000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(mul(180, 0.22, 39.600000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(heavy_delivery, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(le(80, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(heavy_delivery, 1.00)),
                by(rule("ev-range-worlds.pl", clause(16))),
                bindings([binding("T", heavy_delivery), binding("__anon15", 180), binding("__anon16", 80), binding("Temp", 15), binding("__anon17", 700), binding("__anon18", 55), binding("__anon19", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(ge(15, 0)),
                    by(builtin(ge, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(heavy_delivery, 1.15)),
                by(rule("ev-range-worlds.pl", clause(17))),
                bindings([binding("T", heavy_delivery), binding("__anon20", 180), binding("__anon21", 80), binding("__anon22", 15), binding("P", 700), binding("__anon23", 55), binding("__anon24", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(gt(700, 500)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(39.600000000000001, 1.15, 45.539999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(45.539999999999999, 55)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(cold_commute, w1).
why(
  safeInWorld(cold_commute, w1),
  proof(
    goal(safeInWorld(cold_commute, w1)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", cold_commute), binding("W", w1)]),
    uses([
      proof(
        goal(safe_in_world(cold_commute, w1)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", cold_commute), binding("W", w1), binding("__anon39", 120), binding("__anon40", 90), binding("__anon41", -8), binding("__anon42", 100), binding("Battery", 35), binding("__anon43", 0.19), binding("Required", 22.800000000000001)]),
        uses([
          proof(
            goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
            by(fact("ev-range-worlds.pl", clause(12)))
          ),
          proof(
            goal(required_energy(cold_commute, w1, 22.800000000000001)),
            by(rule("ev-range-worlds.pl", clause(21))),
            bindings([binding("T", cold_commute), binding("E", 22.800000000000001)]),
            uses([
              proof(
                goal(base_energy(cold_commute, 22.800000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("D", 120), binding("__anon35", 90), binding("__anon36", -8), binding("__anon37", 100), binding("__anon38", 35), binding("B", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(mul(120, 0.19, 22.800000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(le(22.800000000000001, 35)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(cold_commute, w2).
why(
  safeInWorld(cold_commute, w2),
  proof(
    goal(safeInWorld(cold_commute, w2)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", cold_commute), binding("W", w2)]),
    uses([
      proof(
        goal(safe_in_world(cold_commute, w2)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", cold_commute), binding("W", w2), binding("__anon39", 120), binding("__anon40", 90), binding("__anon41", -8), binding("__anon42", 100), binding("Battery", 35), binding("__anon43", 0.19), binding("Required", 22.800000000000001)]),
        uses([
          proof(
            goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
            by(fact("ev-range-worlds.pl", clause(12)))
          ),
          proof(
            goal(required_energy(cold_commute, w2, 22.800000000000001)),
            by(rule("ev-range-worlds.pl", clause(22))),
            bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("Base", 22.800000000000001), binding("SF", 1.00)]),
            uses([
              proof(
                goal(base_energy(cold_commute, 22.800000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("D", 120), binding("__anon35", 90), binding("__anon36", -8), binding("__anon37", 100), binding("__anon38", 35), binding("B", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(mul(120, 0.19, 22.800000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(cold_commute, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", cold_commute), binding("__anon5", 120), binding("S", 90), binding("__anon6", -8), binding("__anon7", 100), binding("__anon8", 35), binding("__anon9", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(le(90, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(22.800000000000001, 1.00, 22.800000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(22.800000000000001, 35)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(cold_commute, w0).
why(
  safeInWorld(cold_commute, w0),
  proof(
    goal(safeInWorld(cold_commute, w0)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", cold_commute), binding("W", w0)]),
    uses([
      proof(
        goal(safe_in_world(cold_commute, w0)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", cold_commute), binding("W", w0), binding("__anon39", 120), binding("__anon40", 90), binding("__anon41", -8), binding("__anon42", 100), binding("Battery", 35), binding("__anon43", 0.19), binding("Required", 26.219999999999999)]),
        uses([
          proof(
            goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
            by(fact("ev-range-worlds.pl", clause(12)))
          ),
          proof(
            goal(required_energy(cold_commute, w0, 26.219999999999999)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", cold_commute), binding("E", 26.219999999999999), binding("Base", 22.800000000000001), binding("SF", 1.00), binding("TF", 1.15), binding("PF", 1.00), binding("A", 22.800000000000001), binding("B", 26.219999999999999)]),
            uses([
              proof(
                goal(base_energy(cold_commute, 22.800000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("D", 120), binding("__anon35", 90), binding("__anon36", -8), binding("__anon37", 100), binding("__anon38", 35), binding("B", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(mul(120, 0.19, 22.800000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(cold_commute, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", cold_commute), binding("__anon5", 120), binding("S", 90), binding("__anon6", -8), binding("__anon7", 100), binding("__anon8", 35), binding("__anon9", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(le(90, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(cold_commute, 1.15)),
                by(rule("ev-range-worlds.pl", clause(15))),
                bindings([binding("T", cold_commute), binding("__anon10", 120), binding("__anon11", 90), binding("Temp", -8), binding("__anon12", 100), binding("__anon13", 35), binding("__anon14", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(lt(-8, 0)),
                    by(builtin(lt, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(cold_commute, 1.00)),
                by(rule("ev-range-worlds.pl", clause(19))),
                bindings([binding("T", cold_commute), binding("__anon30", 120), binding("__anon31", 90), binding("__anon32", -8), binding("P", 100), binding("__anon33", 35), binding("__anon34", 0.19)]),
                uses([
                  proof(
                    goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                    by(fact("ev-range-worlds.pl", clause(12)))
                  ),
                  proof(
                    goal(le(100, 250)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(22.800000000000001, 1.00, 22.800000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(22.800000000000001, 1.15, 26.219999999999999)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(26.219999999999999, 1.00, 26.219999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(26.219999999999999, 35)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

safeInWorld(cold_commute, w3).
why(
  safeInWorld(cold_commute, w3),
  proof(
    goal(safeInWorld(cold_commute, w3)),
    by(rule("ev-range-worlds.pl", clause(27))),
    bindings([binding("T", cold_commute), binding("W", w3)]),
    uses([
      proof(
        goal(safe_in_world(cold_commute, w3)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", cold_commute), binding("W", w3), binding("__anon39", 120), binding("__anon40", 90), binding("__anon41", -8), binding("__anon42", 100), binding("Battery", 35), binding("__anon43", 0.19), binding("Required", 34.085999999999999)]),
        uses([
          proof(
            goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
            by(fact("ev-range-worlds.pl", clause(12)))
          ),
          proof(
            goal(required_energy(cold_commute, w3, 34.085999999999999)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", cold_commute), binding("E", 34.085999999999999), binding("W0", 26.219999999999999)]),
            uses([
              proof(
                goal(required_energy(cold_commute, w0, 26.219999999999999)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", cold_commute), binding("E", 26.219999999999999), binding("Base", 22.800000000000001), binding("SF", 1.00), binding("TF", 1.15), binding("PF", 1.00), binding("A", 22.800000000000001), binding("B", 26.219999999999999)]),
                uses([
                  proof(
                    goal(base_energy(cold_commute, 22.800000000000001)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("D", 120), binding("__anon35", 90), binding("__anon36", -8), binding("__anon37", 100), binding("__anon38", 35), binding("B", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(mul(120, 0.19, 22.800000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(cold_commute, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", cold_commute), binding("__anon5", 120), binding("S", 90), binding("__anon6", -8), binding("__anon7", 100), binding("__anon8", 35), binding("__anon9", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(le(90, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(cold_commute, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(15))),
                    bindings([binding("T", cold_commute), binding("__anon10", 120), binding("__anon11", 90), binding("Temp", -8), binding("__anon12", 100), binding("__anon13", 35), binding("__anon14", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(lt(-8, 0)),
                        by(builtin(lt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(cold_commute, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(19))),
                    bindings([binding("T", cold_commute), binding("__anon30", 120), binding("__anon31", 90), binding("__anon32", -8), binding("P", 100), binding("__anon33", 35), binding("__anon34", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(le(100, 250)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(22.800000000000001, 1.00, 22.800000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(22.800000000000001, 1.15, 26.219999999999999)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(26.219999999999999, 1.00, 26.219999999999999)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(26.219999999999999, 1.30, 34.085999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(34.085999999999999, 35)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(winter_highway, w2).
why(
  riskyInWorld(winter_highway, w2),
  proof(
    goal(riskyInWorld(winter_highway, w2)),
    by(rule("ev-range-worlds.pl", clause(28))),
    bindings([binding("T", winter_highway), binding("W", w2)]),
    uses([
      proof(
        goal(risky_in_world(winter_highway, w2)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w2), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 62.399999999999999)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w2, 62.399999999999999)),
            by(rule("ev-range-worlds.pl", clause(22))),
            bindings([binding("T", winter_highway), binding("E", 62.399999999999999), binding("Base", 52.0), binding("SF", 1.20)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(winter_highway, 1.20)),
                by(rule("ev-range-worlds.pl", clause(13))),
                bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(115, 100)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(mul(52.0, 1.20, 62.399999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(62.399999999999999, 60)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(winter_highway, w0).
why(
  riskyInWorld(winter_highway, w0),
  proof(
    goal(riskyInWorld(winter_highway, w0)),
    by(rule("ev-range-worlds.pl", clause(28))),
    bindings([binding("T", winter_highway), binding("W", w0)]),
    uses([
      proof(
        goal(risky_in_world(winter_highway, w0)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w0), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 77.500799999999998)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w0, 77.500799999999998)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", winter_highway), binding("E", 77.500799999999998), binding("Base", 52.0), binding("SF", 1.20), binding("TF", 1.15), binding("PF", 1.08), binding("A", 62.399999999999999), binding("B", 71.759999999999991)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(winter_highway, 1.20)),
                by(rule("ev-range-worlds.pl", clause(13))),
                bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(115, 100)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(winter_highway, 1.15)),
                by(rule("ev-range-worlds.pl", clause(15))),
                bindings([binding("T", winter_highway), binding("__anon10", 260), binding("__anon11", 115), binding("Temp", -5), binding("__anon12", 400), binding("__anon13", 60), binding("__anon14", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(lt(-5, 0)),
                    by(builtin(lt, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(winter_highway, 1.08)),
                by(rule("ev-range-worlds.pl", clause(18))),
                bindings([binding("T", winter_highway), binding("__anon25", 260), binding("__anon26", 115), binding("__anon27", -5), binding("P", 400), binding("__anon28", 60), binding("__anon29", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(400, 250)),
                    by(builtin(gt, 2))
                  ),
                  proof(
                    goal(le(400, 500)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(52.0, 1.20, 62.399999999999999)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(62.399999999999999, 1.15, 71.759999999999991)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(71.759999999999991, 1.08, 77.500799999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(77.500799999999998, 60)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(winter_highway, w3).
why(
  riskyInWorld(winter_highway, w3),
  proof(
    goal(riskyInWorld(winter_highway, w3)),
    by(rule("ev-range-worlds.pl", clause(28))),
    bindings([binding("T", winter_highway), binding("W", w3)]),
    uses([
      proof(
        goal(risky_in_world(winter_highway, w3)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w3), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 100.75104)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w3, 100.75104)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", winter_highway), binding("E", 100.75104), binding("W0", 77.500799999999998)]),
            uses([
              proof(
                goal(required_energy(winter_highway, w0, 77.500799999999998)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", winter_highway), binding("E", 77.500799999999998), binding("Base", 52.0), binding("SF", 1.20), binding("TF", 1.15), binding("PF", 1.08), binding("A", 62.399999999999999), binding("B", 71.759999999999991)]),
                uses([
                  proof(
                    goal(base_energy(winter_highway, 52.0)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(mul(260, 0.20, 52.0)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(winter_highway, 1.20)),
                    by(rule("ev-range-worlds.pl", clause(13))),
                    bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(gt(115, 100)),
                        by(builtin(gt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(winter_highway, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(15))),
                    bindings([binding("T", winter_highway), binding("__anon10", 260), binding("__anon11", 115), binding("Temp", -5), binding("__anon12", 400), binding("__anon13", 60), binding("__anon14", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(lt(-5, 0)),
                        by(builtin(lt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(winter_highway, 1.08)),
                    by(rule("ev-range-worlds.pl", clause(18))),
                    bindings([binding("T", winter_highway), binding("__anon25", 260), binding("__anon26", 115), binding("__anon27", -5), binding("P", 400), binding("__anon28", 60), binding("__anon29", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(gt(400, 250)),
                        by(builtin(gt, 2))
                      ),
                      proof(
                        goal(le(400, 500)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(52.0, 1.20, 62.399999999999999)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(62.399999999999999, 1.15, 71.759999999999991)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(71.759999999999991, 1.08, 77.500799999999998)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(77.500799999999998, 1.30, 100.75104)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(100.75104, 60)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

riskyInWorld(heavy_delivery, w3).
why(
  riskyInWorld(heavy_delivery, w3),
  proof(
    goal(riskyInWorld(heavy_delivery, w3)),
    by(rule("ev-range-worlds.pl", clause(28))),
    bindings([binding("T", heavy_delivery), binding("W", w3)]),
    uses([
      proof(
        goal(risky_in_world(heavy_delivery, w3)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", heavy_delivery), binding("W", w3), binding("__anon44", 180), binding("__anon45", 80), binding("__anon46", 15), binding("__anon47", 700), binding("Battery", 55), binding("__anon48", 0.22), binding("Required", 59.201999999999998)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w3, 59.201999999999998)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", heavy_delivery), binding("E", 59.201999999999998), binding("W0", 45.539999999999999)]),
            uses([
              proof(
                goal(required_energy(heavy_delivery, w0, 45.539999999999999)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", heavy_delivery), binding("E", 45.539999999999999), binding("Base", 39.600000000000001), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.15), binding("A", 39.600000000000001), binding("B", 39.600000000000001)]),
                uses([
                  proof(
                    goal(base_energy(heavy_delivery, 39.600000000000001)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(mul(180, 0.22, 39.600000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(le(80, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(16))),
                    bindings([binding("T", heavy_delivery), binding("__anon15", 180), binding("__anon16", 80), binding("Temp", 15), binding("__anon17", 700), binding("__anon18", 55), binding("__anon19", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(ge(15, 0)),
                        by(builtin(ge, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(heavy_delivery, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(17))),
                    bindings([binding("T", heavy_delivery), binding("__anon20", 180), binding("__anon21", 80), binding("__anon22", 15), binding("P", 700), binding("__anon23", 55), binding("__anon24", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(gt(700, 500)),
                        by(builtin(gt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.15, 45.539999999999999)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(45.539999999999999, 1.30, 59.201999999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(59.201999999999998, 55)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

reason(winter_highway, "cold fast payload trip exceeds battery in physics-aware worlds").
why(
  reason(winter_highway, "cold fast payload trip exceeds battery in physics-aware worlds"),
  proof(
    goal(reason(winter_highway, "cold fast payload trip exceeds battery in physics-aware worlds")),
    by(rule("ev-range-worlds.pl", clause(29))),
    uses([
      proof(
        goal(risky_in_world(winter_highway, w0)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w0), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 77.500799999999998)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w0, 77.500799999999998)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", winter_highway), binding("E", 77.500799999999998), binding("Base", 52.0), binding("SF", 1.20), binding("TF", 1.15), binding("PF", 1.08), binding("A", 62.399999999999999), binding("B", 71.759999999999991)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(winter_highway, 1.20)),
                by(rule("ev-range-worlds.pl", clause(13))),
                bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(115, 100)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(winter_highway, 1.15)),
                by(rule("ev-range-worlds.pl", clause(15))),
                bindings([binding("T", winter_highway), binding("__anon10", 260), binding("__anon11", 115), binding("Temp", -5), binding("__anon12", 400), binding("__anon13", 60), binding("__anon14", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(lt(-5, 0)),
                    by(builtin(lt, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(winter_highway, 1.08)),
                by(rule("ev-range-worlds.pl", clause(18))),
                bindings([binding("T", winter_highway), binding("__anon25", 260), binding("__anon26", 115), binding("__anon27", -5), binding("P", 400), binding("__anon28", 60), binding("__anon29", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(400, 250)),
                    by(builtin(gt, 2))
                  ),
                  proof(
                    goal(le(400, 500)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(52.0, 1.20, 62.399999999999999)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(62.399999999999999, 1.15, 71.759999999999991)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(71.759999999999991, 1.08, 77.500799999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(77.500799999999998, 60)),
            by(builtin(gt, 2))
          )
        ])
      ),
      proof(
        goal(risky_in_world(winter_highway, w2)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w2), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 62.399999999999999)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w2, 62.399999999999999)),
            by(rule("ev-range-worlds.pl", clause(22))),
            bindings([binding("T", winter_highway), binding("E", 62.399999999999999), binding("Base", 52.0), binding("SF", 1.20)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(winter_highway, 1.20)),
                by(rule("ev-range-worlds.pl", clause(13))),
                bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(115, 100)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(mul(52.0, 1.20, 62.399999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(62.399999999999999, 60)),
            by(builtin(gt, 2))
          )
        ])
      ),
      proof(
        goal(risky_in_world(winter_highway, w3)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w3), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 100.75104)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w3, 100.75104)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", winter_highway), binding("E", 100.75104), binding("W0", 77.500799999999998)]),
            uses([
              proof(
                goal(required_energy(winter_highway, w0, 77.500799999999998)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", winter_highway), binding("E", 77.500799999999998), binding("Base", 52.0), binding("SF", 1.20), binding("TF", 1.15), binding("PF", 1.08), binding("A", 62.399999999999999), binding("B", 71.759999999999991)]),
                uses([
                  proof(
                    goal(base_energy(winter_highway, 52.0)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(mul(260, 0.20, 52.0)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(winter_highway, 1.20)),
                    by(rule("ev-range-worlds.pl", clause(13))),
                    bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(gt(115, 100)),
                        by(builtin(gt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(winter_highway, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(15))),
                    bindings([binding("T", winter_highway), binding("__anon10", 260), binding("__anon11", 115), binding("Temp", -5), binding("__anon12", 400), binding("__anon13", 60), binding("__anon14", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(lt(-5, 0)),
                        by(builtin(lt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(winter_highway, 1.08)),
                    by(rule("ev-range-worlds.pl", clause(18))),
                    bindings([binding("T", winter_highway), binding("__anon25", 260), binding("__anon26", 115), binding("__anon27", -5), binding("P", 400), binding("__anon28", 60), binding("__anon29", 0.20)]),
                    uses([
                      proof(
                        goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                        by(fact("ev-range-worlds.pl", clause(10)))
                      ),
                      proof(
                        goal(gt(400, 250)),
                        by(builtin(gt, 2))
                      ),
                      proof(
                        goal(le(400, 500)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(52.0, 1.20, 62.399999999999999)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(62.399999999999999, 1.15, 71.759999999999991)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(71.759999999999991, 1.08, 77.500799999999998)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(77.500799999999998, 1.30, 100.75104)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(100.75104, 60)),
            by(builtin(gt, 2))
          )
        ])
      ),
      proof(
        goal(safe_in_world(winter_highway, w1)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", winter_highway), binding("W", w1), binding("__anon39", 260), binding("__anon40", 115), binding("__anon41", -5), binding("__anon42", 400), binding("Battery", 60), binding("__anon43", 0.20), binding("Required", 52.0)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w1, 52.0)),
            by(rule("ev-range-worlds.pl", clause(21))),
            bindings([binding("T", winter_highway), binding("E", 52.0)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(le(52.0, 60)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

reason(heavy_delivery, "safety buffer turns a physics-safe delivery into a cautious risk").
why(
  reason(heavy_delivery, "safety buffer turns a physics-safe delivery into a cautious risk"),
  proof(
    goal(reason(heavy_delivery, "safety buffer turns a physics-safe delivery into a cautious risk")),
    by(rule("ev-range-worlds.pl", clause(30))),
    uses([
      proof(
        goal(safe_in_world(heavy_delivery, w0)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", heavy_delivery), binding("W", w0), binding("__anon39", 180), binding("__anon40", 80), binding("__anon41", 15), binding("__anon42", 700), binding("Battery", 55), binding("__anon43", 0.22), binding("Required", 45.539999999999999)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w0, 45.539999999999999)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", heavy_delivery), binding("E", 45.539999999999999), binding("Base", 39.600000000000001), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.15), binding("A", 39.600000000000001), binding("B", 39.600000000000001)]),
            uses([
              proof(
                goal(base_energy(heavy_delivery, 39.600000000000001)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(mul(180, 0.22, 39.600000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(heavy_delivery, 1.00)),
                by(rule("ev-range-worlds.pl", clause(14))),
                bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(le(80, 100)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(heavy_delivery, 1.00)),
                by(rule("ev-range-worlds.pl", clause(16))),
                bindings([binding("T", heavy_delivery), binding("__anon15", 180), binding("__anon16", 80), binding("Temp", 15), binding("__anon17", 700), binding("__anon18", 55), binding("__anon19", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(ge(15, 0)),
                    by(builtin(ge, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(heavy_delivery, 1.15)),
                by(rule("ev-range-worlds.pl", clause(17))),
                bindings([binding("T", heavy_delivery), binding("__anon20", 180), binding("__anon21", 80), binding("__anon22", 15), binding("P", 700), binding("__anon23", 55), binding("__anon24", 0.22)]),
                uses([
                  proof(
                    goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                    by(fact("ev-range-worlds.pl", clause(11)))
                  ),
                  proof(
                    goal(gt(700, 500)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(39.600000000000001, 1.15, 45.539999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(45.539999999999999, 55)),
            by(builtin(le, 2))
          )
        ])
      ),
      proof(
        goal(risky_in_world(heavy_delivery, w3)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", heavy_delivery), binding("W", w3), binding("__anon44", 180), binding("__anon45", 80), binding("__anon46", 15), binding("__anon47", 700), binding("Battery", 55), binding("__anon48", 0.22), binding("Required", 59.201999999999998)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w3, 59.201999999999998)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", heavy_delivery), binding("E", 59.201999999999998), binding("W0", 45.539999999999999)]),
            uses([
              proof(
                goal(required_energy(heavy_delivery, w0, 45.539999999999999)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", heavy_delivery), binding("E", 45.539999999999999), binding("Base", 39.600000000000001), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.15), binding("A", 39.600000000000001), binding("B", 39.600000000000001)]),
                uses([
                  proof(
                    goal(base_energy(heavy_delivery, 39.600000000000001)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(mul(180, 0.22, 39.600000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(le(80, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(16))),
                    bindings([binding("T", heavy_delivery), binding("__anon15", 180), binding("__anon16", 80), binding("Temp", 15), binding("__anon17", 700), binding("__anon18", 55), binding("__anon19", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(ge(15, 0)),
                        by(builtin(ge, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(heavy_delivery, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(17))),
                    bindings([binding("T", heavy_delivery), binding("__anon20", 180), binding("__anon21", 80), binding("__anon22", 15), binding("P", 700), binding("__anon23", 55), binding("__anon24", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(gt(700, 500)),
                        by(builtin(gt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.15, 45.539999999999999)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(45.539999999999999, 1.30, 59.201999999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(59.201999999999998, 55)),
            by(builtin(gt, 2))
          )
        ])
      )
    ])
  )
).

status(ev_range_worlds, expected_world_pattern).
why(
  status(ev_range_worlds, expected_world_pattern),
  proof(
    goal(status(ev_range_worlds, expected_world_pattern)),
    by(rule("ev-range-worlds.pl", clause(31))),
    uses([
      proof(
        goal(safe_in_world(city_errand, w3)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", city_errand), binding("W", w3), binding("__anon39", 40), binding("__anon40", 45), binding("__anon41", 20), binding("__anon42", 100), binding("Battery", 30), binding("__anon43", 0.18), binding("Required", 9.3599999999999994)]),
        uses([
          proof(
            goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
            by(fact("ev-range-worlds.pl", clause(9)))
          ),
          proof(
            goal(required_energy(city_errand, w3, 9.3599999999999994)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", city_errand), binding("E", 9.3599999999999994), binding("W0", 7.1999999999999993)]),
            uses([
              proof(
                goal(required_energy(city_errand, w0, 7.1999999999999993)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("Base", 7.1999999999999993), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.00), binding("A", 7.1999999999999993), binding("B", 7.1999999999999993)]),
                uses([
                  proof(
                    goal(base_energy(city_errand, 7.1999999999999993)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", city_errand), binding("E", 7.1999999999999993), binding("D", 40), binding("__anon35", 45), binding("__anon36", 20), binding("__anon37", 100), binding("__anon38", 30), binding("B", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(mul(40, 0.18, 7.1999999999999993)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", city_errand), binding("__anon5", 40), binding("S", 45), binding("__anon6", 20), binding("__anon7", 100), binding("__anon8", 30), binding("__anon9", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(le(45, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(16))),
                    bindings([binding("T", city_errand), binding("__anon15", 40), binding("__anon16", 45), binding("Temp", 20), binding("__anon17", 100), binding("__anon18", 30), binding("__anon19", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(ge(20, 0)),
                        by(builtin(ge, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(city_errand, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(19))),
                    bindings([binding("T", city_errand), binding("__anon30", 40), binding("__anon31", 45), binding("__anon32", 20), binding("P", 100), binding("__anon33", 30), binding("__anon34", 0.18)]),
                    uses([
                      proof(
                        goal(trip_data(city_errand, 40, 45, 20, 100, 30, 0.18)),
                        by(fact("ev-range-worlds.pl", clause(9)))
                      ),
                      proof(
                        goal(le(100, 250)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(7.1999999999999993, 1.00, 7.1999999999999993)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(7.1999999999999993, 1.30, 9.3599999999999994)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(9.3599999999999994, 30)),
            by(builtin(le, 2))
          )
        ])
      ),
      proof(
        goal(risky_in_world(winter_highway, w0)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", winter_highway), binding("W", w0), binding("__anon44", 260), binding("__anon45", 115), binding("__anon46", -5), binding("__anon47", 400), binding("Battery", 60), binding("__anon48", 0.20), binding("Required", 77.500799999999998)]),
        uses([
          proof(
            goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
            by(fact("ev-range-worlds.pl", clause(10)))
          ),
          proof(
            goal(required_energy(winter_highway, w0, 77.500799999999998)),
            by(rule("ev-range-worlds.pl", clause(23))),
            bindings([binding("T", winter_highway), binding("E", 77.500799999999998), binding("Base", 52.0), binding("SF", 1.20), binding("TF", 1.15), binding("PF", 1.08), binding("A", 62.399999999999999), binding("B", 71.759999999999991)]),
            uses([
              proof(
                goal(base_energy(winter_highway, 52.0)),
                by(rule("ev-range-worlds.pl", clause(20))),
                bindings([binding("T", winter_highway), binding("E", 52.0), binding("D", 260), binding("__anon35", 115), binding("__anon36", -5), binding("__anon37", 400), binding("__anon38", 60), binding("B", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(mul(260, 0.20, 52.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(speed_factor(winter_highway, 1.20)),
                by(rule("ev-range-worlds.pl", clause(13))),
                bindings([binding("T", winter_highway), binding("__anon0", 260), binding("S", 115), binding("__anon1", -5), binding("__anon2", 400), binding("__anon3", 60), binding("__anon4", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(115, 100)),
                    by(builtin(gt, 2))
                  )
                ])
              ),
              proof(
                goal(temperature_factor(winter_highway, 1.15)),
                by(rule("ev-range-worlds.pl", clause(15))),
                bindings([binding("T", winter_highway), binding("__anon10", 260), binding("__anon11", 115), binding("Temp", -5), binding("__anon12", 400), binding("__anon13", 60), binding("__anon14", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(lt(-5, 0)),
                    by(builtin(lt, 2))
                  )
                ])
              ),
              proof(
                goal(payload_factor(winter_highway, 1.08)),
                by(rule("ev-range-worlds.pl", clause(18))),
                bindings([binding("T", winter_highway), binding("__anon25", 260), binding("__anon26", 115), binding("__anon27", -5), binding("P", 400), binding("__anon28", 60), binding("__anon29", 0.20)]),
                uses([
                  proof(
                    goal(trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20)),
                    by(fact("ev-range-worlds.pl", clause(10)))
                  ),
                  proof(
                    goal(gt(400, 250)),
                    by(builtin(gt, 2))
                  ),
                  proof(
                    goal(le(400, 500)),
                    by(builtin(le, 2))
                  )
                ])
              ),
              proof(
                goal(mul(52.0, 1.20, 62.399999999999999)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(62.399999999999999, 1.15, 71.759999999999991)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(71.759999999999991, 1.08, 77.500799999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(77.500799999999998, 60)),
            by(builtin(gt, 2))
          )
        ])
      ),
      proof(
        goal(risky_in_world(heavy_delivery, w3)),
        by(rule("ev-range-worlds.pl", clause(26))),
        bindings([binding("T", heavy_delivery), binding("W", w3), binding("__anon44", 180), binding("__anon45", 80), binding("__anon46", 15), binding("__anon47", 700), binding("Battery", 55), binding("__anon48", 0.22), binding("Required", 59.201999999999998)]),
        uses([
          proof(
            goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
            by(fact("ev-range-worlds.pl", clause(11)))
          ),
          proof(
            goal(required_energy(heavy_delivery, w3, 59.201999999999998)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", heavy_delivery), binding("E", 59.201999999999998), binding("W0", 45.539999999999999)]),
            uses([
              proof(
                goal(required_energy(heavy_delivery, w0, 45.539999999999999)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", heavy_delivery), binding("E", 45.539999999999999), binding("Base", 39.600000000000001), binding("SF", 1.00), binding("TF", 1.00), binding("PF", 1.15), binding("A", 39.600000000000001), binding("B", 39.600000000000001)]),
                uses([
                  proof(
                    goal(base_energy(heavy_delivery, 39.600000000000001)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", heavy_delivery), binding("E", 39.600000000000001), binding("D", 180), binding("__anon35", 80), binding("__anon36", 15), binding("__anon37", 700), binding("__anon38", 55), binding("B", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(mul(180, 0.22, 39.600000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", heavy_delivery), binding("__anon5", 180), binding("S", 80), binding("__anon6", 15), binding("__anon7", 700), binding("__anon8", 55), binding("__anon9", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(le(80, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(heavy_delivery, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(16))),
                    bindings([binding("T", heavy_delivery), binding("__anon15", 180), binding("__anon16", 80), binding("Temp", 15), binding("__anon17", 700), binding("__anon18", 55), binding("__anon19", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(ge(15, 0)),
                        by(builtin(ge, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(heavy_delivery, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(17))),
                    bindings([binding("T", heavy_delivery), binding("__anon20", 180), binding("__anon21", 80), binding("__anon22", 15), binding("P", 700), binding("__anon23", 55), binding("__anon24", 0.22)]),
                    uses([
                      proof(
                        goal(trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22)),
                        by(fact("ev-range-worlds.pl", clause(11)))
                      ),
                      proof(
                        goal(gt(700, 500)),
                        by(builtin(gt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.00, 39.600000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(39.600000000000001, 1.15, 45.539999999999999)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(45.539999999999999, 1.30, 59.201999999999998)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(gt(59.201999999999998, 55)),
            by(builtin(gt, 2))
          )
        ])
      ),
      proof(
        goal(safe_in_world(cold_commute, w3)),
        by(rule("ev-range-worlds.pl", clause(25))),
        bindings([binding("T", cold_commute), binding("W", w3), binding("__anon39", 120), binding("__anon40", 90), binding("__anon41", -8), binding("__anon42", 100), binding("Battery", 35), binding("__anon43", 0.19), binding("Required", 34.085999999999999)]),
        uses([
          proof(
            goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
            by(fact("ev-range-worlds.pl", clause(12)))
          ),
          proof(
            goal(required_energy(cold_commute, w3, 34.085999999999999)),
            by(rule("ev-range-worlds.pl", clause(24))),
            bindings([binding("T", cold_commute), binding("E", 34.085999999999999), binding("W0", 26.219999999999999)]),
            uses([
              proof(
                goal(required_energy(cold_commute, w0, 26.219999999999999)),
                by(rule("ev-range-worlds.pl", clause(23))),
                bindings([binding("T", cold_commute), binding("E", 26.219999999999999), binding("Base", 22.800000000000001), binding("SF", 1.00), binding("TF", 1.15), binding("PF", 1.00), binding("A", 22.800000000000001), binding("B", 26.219999999999999)]),
                uses([
                  proof(
                    goal(base_energy(cold_commute, 22.800000000000001)),
                    by(rule("ev-range-worlds.pl", clause(20))),
                    bindings([binding("T", cold_commute), binding("E", 22.800000000000001), binding("D", 120), binding("__anon35", 90), binding("__anon36", -8), binding("__anon37", 100), binding("__anon38", 35), binding("B", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(mul(120, 0.19, 22.800000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(speed_factor(cold_commute, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(14))),
                    bindings([binding("T", cold_commute), binding("__anon5", 120), binding("S", 90), binding("__anon6", -8), binding("__anon7", 100), binding("__anon8", 35), binding("__anon9", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(le(90, 100)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(temperature_factor(cold_commute, 1.15)),
                    by(rule("ev-range-worlds.pl", clause(15))),
                    bindings([binding("T", cold_commute), binding("__anon10", 120), binding("__anon11", 90), binding("Temp", -8), binding("__anon12", 100), binding("__anon13", 35), binding("__anon14", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(lt(-8, 0)),
                        by(builtin(lt, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(payload_factor(cold_commute, 1.00)),
                    by(rule("ev-range-worlds.pl", clause(19))),
                    bindings([binding("T", cold_commute), binding("__anon30", 120), binding("__anon31", 90), binding("__anon32", -8), binding("P", 100), binding("__anon33", 35), binding("__anon34", 0.19)]),
                    uses([
                      proof(
                        goal(trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19)),
                        by(fact("ev-range-worlds.pl", clause(12)))
                      ),
                      proof(
                        goal(le(100, 250)),
                        by(builtin(le, 2))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(22.800000000000001, 1.00, 22.800000000000001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(22.800000000000001, 1.15, 26.219999999999999)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(26.219999999999999, 1.00, 26.219999999999999)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(26.219999999999999, 1.30, 34.085999999999999)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(le(34.085999999999999, 35)),
            by(builtin(le, 2))
          )
        ])
      )
    ])
  )
).

