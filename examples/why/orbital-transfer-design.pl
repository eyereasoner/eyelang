transferSemiMajorAxis_km(mars_hohmann, 188768535.34999999).
why(
  transferSemiMajorAxis_km(mars_hohmann, 188768535.34999999),
  proof(
    goal(transferSemiMajorAxis_km(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(24))),
    bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999)]),
    uses([
      proof(
        goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
        bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
        uses([
          proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
          proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
          proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
          proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

departureDeltaV_km_s(mars_hohmann, 2.9446911328430403).
why(
  departureDeltaV_km_s(mars_hohmann, 2.9446911328430403),
  proof(
    goal(departureDeltaV_km_s(mars_hohmann, 2.9446911328430403)), by(rule("orbital-transfer-design.pl", clause(25))),
    bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.9446911328430403)]),
    uses([
      proof(
        goal(departure_delta_v(mars_hohmann, 2.9446911328430403)), by(rule("orbital-transfer-design.pl", clause(19))),
        bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.9446911328430403), binding("TransferSpeed", 32.729382964539845), binding("CircularSpeed", 29.784691831696804)]),
        uses([
          proof(
            goal(transfer_speed_at_departure(mars_hohmann, 32.729382964539845)), by(rule("orbital-transfer-design.pl", clause(17))),
            bindings([binding("Mission", mars_hohmann), binding("Speed", 32.729382964539845), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 1.3369174244536893e-8), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 8.0716812161257888e-9), binding("SpeedSquared", 1071.2125092395111)]),
            uses([
              proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
              proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
              proof(
                goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                uses([
                  proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                  proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                  proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                  proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(div(2.0, 149597870.7, 1.3369174244536893e-8)), by(builtin(div, 3))),
              proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
              proof(goal(sub(1.3369174244536893e-8, 5.297493028411104e-9, 8.0716812161257888e-9)), by(builtin(sub, 3))),
              proof(goal(mul(132712440018.0, 8.0716812161257888e-9, 1071.2125092395111)), by(builtin(mul, 3))),
              proof(goal(pow(1071.2125092395111, 0.5, 32.729382964539845)), by(builtin(pow, 3)))
            ])
          ),
          proof(
            goal(circular_speed_at_departure(mars_hohmann, 29.784691831696804)), by(rule("orbital-transfer-design.pl", clause(15))),
            bindings([binding("Mission", mars_hohmann), binding("Speed", 29.784691831696804), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("SpeedSquared", 887.12786750914643)]),
            uses([
              proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
              proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
              proof(goal(div(132712440018.0, 149597870.7, 887.12786750914643)), by(builtin(div, 3))),
              proof(goal(pow(887.12786750914643, 0.5, 29.784691831696804)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(sub(32.729382964539845, 29.784691831696804, 2.9446911328430403)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

arrivalDeltaV_km_s(mars_hohmann, 2.6488967223855973).
why(
  arrivalDeltaV_km_s(mars_hohmann, 2.6488967223855973),
  proof(
    goal(arrivalDeltaV_km_s(mars_hohmann, 2.6488967223855973)), by(rule("orbital-transfer-design.pl", clause(26))),
    bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.6488967223855973)]),
    uses([
      proof(
        goal(arrival_delta_v(mars_hohmann, 2.6488967223855973)), by(rule("orbital-transfer-design.pl", clause(20))),
        bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.6488967223855973), binding("CircularSpeed", 24.129388014888221), binding("TransferSpeed", 21.480491292502624)]),
        uses([
          proof(
            goal(circular_speed_at_arrival(mars_hohmann, 24.129388014888221)), by(rule("orbital-transfer-design.pl", clause(16))),
            bindings([binding("Mission", mars_hohmann), binding("Speed", 24.129388014888221), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("SpeedSquared", 582.2273659730314)]),
            uses([
              proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
              proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
              proof(goal(div(132712440018.0, 227939200.0, 582.2273659730314)), by(builtin(div, 3))),
              proof(goal(pow(582.2273659730314, 0.5, 24.129388014888221)), by(builtin(pow, 3)))
            ])
          ),
          proof(
            goal(transfer_speed_at_arrival(mars_hohmann, 21.480491292502624)), by(rule("orbital-transfer-design.pl", clause(18))),
            bindings([binding("Mission", mars_hohmann), binding("Speed", 21.480491292502624), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 8.7742696297960164e-9), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 3.4767766013849123e-9), binding("SpeedSquared", 461.41150616728106)]),
            uses([
              proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
              proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
              proof(
                goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                uses([
                  proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                  proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                  proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                  proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(div(2.0, 227939200.0, 8.7742696297960164e-9)), by(builtin(div, 3))),
              proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
              proof(goal(sub(8.7742696297960164e-9, 5.297493028411104e-9, 3.4767766013849123e-9)), by(builtin(sub, 3))),
              proof(goal(mul(132712440018.0, 3.4767766013849123e-9, 461.41150616728106)), by(builtin(mul, 3))),
              proof(goal(pow(461.41150616728106, 0.5, 21.480491292502624)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(sub(24.129388014888221, 21.480491292502624, 2.6488967223855973)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

totalDeltaV_km_s(mars_hohmann, 5.5935878552286376).
why(
  totalDeltaV_km_s(mars_hohmann, 5.5935878552286376),
  proof(
    goal(totalDeltaV_km_s(mars_hohmann, 5.5935878552286376)), by(rule("orbital-transfer-design.pl", clause(27))),
    bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376)]),
    uses([
      proof(
        goal(total_delta_v(mars_hohmann, 5.5935878552286376)), by(rule("orbital-transfer-design.pl", clause(21))),
        bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376), binding("Depart", 2.9446911328430403), binding("Arrive", 2.6488967223855973)]),
        uses([
          proof(
            goal(departure_delta_v(mars_hohmann, 2.9446911328430403)), by(rule("orbital-transfer-design.pl", clause(19))),
            bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.9446911328430403), binding("TransferSpeed", 32.729382964539845), binding("CircularSpeed", 29.784691831696804)]),
            uses([
              proof(
                goal(transfer_speed_at_departure(mars_hohmann, 32.729382964539845)), by(rule("orbital-transfer-design.pl", clause(17))),
                bindings([binding("Mission", mars_hohmann), binding("Speed", 32.729382964539845), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 1.3369174244536893e-8), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 8.0716812161257888e-9), binding("SpeedSquared", 1071.2125092395111)]),
                uses([
                  proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                  proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                  proof(
                    goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                    bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                    uses([
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                      proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(div(2.0, 149597870.7, 1.3369174244536893e-8)), by(builtin(div, 3))),
                  proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                  proof(goal(sub(1.3369174244536893e-8, 5.297493028411104e-9, 8.0716812161257888e-9)), by(builtin(sub, 3))),
                  proof(goal(mul(132712440018.0, 8.0716812161257888e-9, 1071.2125092395111)), by(builtin(mul, 3))),
                  proof(goal(pow(1071.2125092395111, 0.5, 32.729382964539845)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(circular_speed_at_departure(mars_hohmann, 29.784691831696804)), by(rule("orbital-transfer-design.pl", clause(15))),
                bindings([binding("Mission", mars_hohmann), binding("Speed", 29.784691831696804), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("SpeedSquared", 887.12786750914643)]),
                uses([
                  proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                  proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                  proof(goal(div(132712440018.0, 149597870.7, 887.12786750914643)), by(builtin(div, 3))),
                  proof(goal(pow(887.12786750914643, 0.5, 29.784691831696804)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(32.729382964539845, 29.784691831696804, 2.9446911328430403)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(arrival_delta_v(mars_hohmann, 2.6488967223855973)), by(rule("orbital-transfer-design.pl", clause(20))),
            bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.6488967223855973), binding("CircularSpeed", 24.129388014888221), binding("TransferSpeed", 21.480491292502624)]),
            uses([
              proof(
                goal(circular_speed_at_arrival(mars_hohmann, 24.129388014888221)), by(rule("orbital-transfer-design.pl", clause(16))),
                bindings([binding("Mission", mars_hohmann), binding("Speed", 24.129388014888221), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("SpeedSquared", 582.2273659730314)]),
                uses([
                  proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                  proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                  proof(goal(div(132712440018.0, 227939200.0, 582.2273659730314)), by(builtin(div, 3))),
                  proof(goal(pow(582.2273659730314, 0.5, 24.129388014888221)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(transfer_speed_at_arrival(mars_hohmann, 21.480491292502624)), by(rule("orbital-transfer-design.pl", clause(18))),
                bindings([binding("Mission", mars_hohmann), binding("Speed", 21.480491292502624), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 8.7742696297960164e-9), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 3.4767766013849123e-9), binding("SpeedSquared", 461.41150616728106)]),
                uses([
                  proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                  proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                  proof(
                    goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                    bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                    uses([
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                      proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(div(2.0, 227939200.0, 8.7742696297960164e-9)), by(builtin(div, 3))),
                  proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                  proof(goal(sub(8.7742696297960164e-9, 5.297493028411104e-9, 3.4767766013849123e-9)), by(builtin(sub, 3))),
                  proof(goal(mul(132712440018.0, 3.4767766013849123e-9, 461.41150616728106)), by(builtin(mul, 3))),
                  proof(goal(pow(461.41150616728106, 0.5, 21.480491292502624)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(24.129388014888221, 21.480491292502624, 2.6488967223855973)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(add(2.9446911328430403, 2.6488967223855973, 5.5935878552286376)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

transferTime_days(mars_hohmann, 258.86582676796297).
why(
  transferTime_days(mars_hohmann, 258.86582676796297),
  proof(
    goal(transferTime_days(mars_hohmann, 258.86582676796297)), by(rule("orbital-transfer-design.pl", clause(28))),
    bindings([binding("Mission", mars_hohmann), binding("Days", 258.86582676796297)]),
    uses([
      proof(
        goal(transfer_time_days(mars_hohmann, 258.86582676796297)), by(rule("orbital-transfer-design.pl", clause(22))),
        bindings([binding("Mission", mars_hohmann), binding("Days", 258.86582676796297), binding("Axis", 188768535.34999999), binding("Mu", 132712440018.0), binding("Pi", 3.141592653589793), binding("SecondsPerDay", 86400.0), binding("AxisCubed", 6.726494918837467e+24), binding("TimeFactor", 50684735492205.117), binding("HalfPeriodBase", 7119321.2803051053), binding("Seconds", 22366007.432751998)]),
        uses([
          proof(
            goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
            bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
            uses([
              proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
              proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
              proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
              proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
          proof(goal(mission(mars_hohmann, pi, 3.141592653589793)), by(fact("orbital-transfer-design.pl", clause(12)))),
          proof(goal(mission(mars_hohmann, secondsPerDay, 86400.0)), by(fact("orbital-transfer-design.pl", clause(13)))),
          proof(goal(pow(188768535.34999999, 3.0, 6.726494918837467e+24)), by(builtin(pow, 3))),
          proof(goal(div(6.726494918837467e+24, 132712440018.0, 50684735492205.117)), by(builtin(div, 3))),
          proof(goal(pow(50684735492205.117, 0.5, 7119321.2803051053)), by(builtin(pow, 3))),
          proof(goal(mul(3.141592653589793, 7119321.2803051053, 22366007.432751998)), by(builtin(mul, 3))),
          proof(goal(div(22366007.432751998, 86400.0, 258.86582676796297)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

status(mars_hohmann, feasible_reference_transfer).
why(
  status(mars_hohmann, feasible_reference_transfer),
  proof(
    goal(status(mars_hohmann, feasible_reference_transfer)), by(rule("orbital-transfer-design.pl", clause(29))),
    bindings([binding("Mission", mars_hohmann)]),
    uses([
      proof(
        goal(within_delta_v_budget(mars_hohmann)), by(rule("orbital-transfer-design.pl", clause(23))),
        bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376), binding("Budget", 6.0)]),
        uses([
          proof(
            goal(total_delta_v(mars_hohmann, 5.5935878552286376)), by(rule("orbital-transfer-design.pl", clause(21))),
            bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376), binding("Depart", 2.9446911328430403), binding("Arrive", 2.6488967223855973)]),
            uses([
              proof(
                goal(departure_delta_v(mars_hohmann, 2.9446911328430403)), by(rule("orbital-transfer-design.pl", clause(19))),
                bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.9446911328430403), binding("TransferSpeed", 32.729382964539845), binding("CircularSpeed", 29.784691831696804)]),
                uses([
                  proof(
                    goal(transfer_speed_at_departure(mars_hohmann, 32.729382964539845)), by(rule("orbital-transfer-design.pl", clause(17))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 32.729382964539845), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 1.3369174244536893e-8), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 8.0716812161257888e-9), binding("SpeedSquared", 1071.2125092395111)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(
                        goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                        bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                        uses([
                          proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                          proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                          proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                          proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(div(2.0, 149597870.7, 1.3369174244536893e-8)), by(builtin(div, 3))),
                      proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                      proof(goal(sub(1.3369174244536893e-8, 5.297493028411104e-9, 8.0716812161257888e-9)), by(builtin(sub, 3))),
                      proof(goal(mul(132712440018.0, 8.0716812161257888e-9, 1071.2125092395111)), by(builtin(mul, 3))),
                      proof(goal(pow(1071.2125092395111, 0.5, 32.729382964539845)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(circular_speed_at_departure(mars_hohmann, 29.784691831696804)), by(rule("orbital-transfer-design.pl", clause(15))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 29.784691831696804), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("SpeedSquared", 887.12786750914643)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(goal(div(132712440018.0, 149597870.7, 887.12786750914643)), by(builtin(div, 3))),
                      proof(goal(pow(887.12786750914643, 0.5, 29.784691831696804)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(sub(32.729382964539845, 29.784691831696804, 2.9446911328430403)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(arrival_delta_v(mars_hohmann, 2.6488967223855973)), by(rule("orbital-transfer-design.pl", clause(20))),
                bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.6488967223855973), binding("CircularSpeed", 24.129388014888221), binding("TransferSpeed", 21.480491292502624)]),
                uses([
                  proof(
                    goal(circular_speed_at_arrival(mars_hohmann, 24.129388014888221)), by(rule("orbital-transfer-design.pl", clause(16))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 24.129388014888221), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("SpeedSquared", 582.2273659730314)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(goal(div(132712440018.0, 227939200.0, 582.2273659730314)), by(builtin(div, 3))),
                      proof(goal(pow(582.2273659730314, 0.5, 24.129388014888221)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(transfer_speed_at_arrival(mars_hohmann, 21.480491292502624)), by(rule("orbital-transfer-design.pl", clause(18))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 21.480491292502624), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 8.7742696297960164e-9), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 3.4767766013849123e-9), binding("SpeedSquared", 461.41150616728106)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(
                        goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                        bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                        uses([
                          proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                          proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                          proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                          proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(div(2.0, 227939200.0, 8.7742696297960164e-9)), by(builtin(div, 3))),
                      proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                      proof(goal(sub(8.7742696297960164e-9, 5.297493028411104e-9, 3.4767766013849123e-9)), by(builtin(sub, 3))),
                      proof(goal(mul(132712440018.0, 3.4767766013849123e-9, 461.41150616728106)), by(builtin(mul, 3))),
                      proof(goal(pow(461.41150616728106, 0.5, 21.480491292502624)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(sub(24.129388014888221, 21.480491292502624, 2.6488967223855973)), by(builtin(sub, 3)))
                ])
              ),
              proof(goal(add(2.9446911328430403, 2.6488967223855973, 5.5935878552286376)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(mission(mars_hohmann, deltaVBudget_km_s, 6.0)), by(fact("orbital-transfer-design.pl", clause(11)))),
          proof(goal(le(5.5935878552286376, 6.0)), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

reason(mars_hohmann, "total Hohmann transfer delta-v is within the mission budget").
why(
  reason(mars_hohmann, "total Hohmann transfer delta-v is within the mission budget"),
  proof(
    goal(reason(mars_hohmann, "total Hohmann transfer delta-v is within the mission budget")), by(rule("orbital-transfer-design.pl", clause(30))),
    bindings([binding("Mission", mars_hohmann)]),
    uses([
      proof(
        goal(within_delta_v_budget(mars_hohmann)), by(rule("orbital-transfer-design.pl", clause(23))),
        bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376), binding("Budget", 6.0)]),
        uses([
          proof(
            goal(total_delta_v(mars_hohmann, 5.5935878552286376)), by(rule("orbital-transfer-design.pl", clause(21))),
            bindings([binding("Mission", mars_hohmann), binding("Total", 5.5935878552286376), binding("Depart", 2.9446911328430403), binding("Arrive", 2.6488967223855973)]),
            uses([
              proof(
                goal(departure_delta_v(mars_hohmann, 2.9446911328430403)), by(rule("orbital-transfer-design.pl", clause(19))),
                bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.9446911328430403), binding("TransferSpeed", 32.729382964539845), binding("CircularSpeed", 29.784691831696804)]),
                uses([
                  proof(
                    goal(transfer_speed_at_departure(mars_hohmann, 32.729382964539845)), by(rule("orbital-transfer-design.pl", clause(17))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 32.729382964539845), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 1.3369174244536893e-8), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 8.0716812161257888e-9), binding("SpeedSquared", 1071.2125092395111)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(
                        goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                        bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                        uses([
                          proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                          proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                          proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                          proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(div(2.0, 149597870.7, 1.3369174244536893e-8)), by(builtin(div, 3))),
                      proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                      proof(goal(sub(1.3369174244536893e-8, 5.297493028411104e-9, 8.0716812161257888e-9)), by(builtin(sub, 3))),
                      proof(goal(mul(132712440018.0, 8.0716812161257888e-9, 1071.2125092395111)), by(builtin(mul, 3))),
                      proof(goal(pow(1071.2125092395111, 0.5, 32.729382964539845)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(circular_speed_at_departure(mars_hohmann, 29.784691831696804)), by(rule("orbital-transfer-design.pl", clause(15))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 29.784691831696804), binding("Mu", 132712440018.0), binding("Radius", 149597870.7), binding("SpeedSquared", 887.12786750914643)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                      proof(goal(div(132712440018.0, 149597870.7, 887.12786750914643)), by(builtin(div, 3))),
                      proof(goal(pow(887.12786750914643, 0.5, 29.784691831696804)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(sub(32.729382964539845, 29.784691831696804, 2.9446911328430403)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(arrival_delta_v(mars_hohmann, 2.6488967223855973)), by(rule("orbital-transfer-design.pl", clause(20))),
                bindings([binding("Mission", mars_hohmann), binding("DeltaV", 2.6488967223855973), binding("CircularSpeed", 24.129388014888221), binding("TransferSpeed", 21.480491292502624)]),
                uses([
                  proof(
                    goal(circular_speed_at_arrival(mars_hohmann, 24.129388014888221)), by(rule("orbital-transfer-design.pl", clause(16))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 24.129388014888221), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("SpeedSquared", 582.2273659730314)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(goal(div(132712440018.0, 227939200.0, 582.2273659730314)), by(builtin(div, 3))),
                      proof(goal(pow(582.2273659730314, 0.5, 24.129388014888221)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(transfer_speed_at_arrival(mars_hohmann, 21.480491292502624)), by(rule("orbital-transfer-design.pl", clause(18))),
                    bindings([binding("Mission", mars_hohmann), binding("Speed", 21.480491292502624), binding("Mu", 132712440018.0), binding("Radius", 227939200.0), binding("Axis", 188768535.34999999), binding("TwiceOverRadius", 8.7742696297960164e-9), binding("OneOverAxis", 5.297493028411104e-9), binding("Bracket", 3.4767766013849123e-9), binding("SpeedSquared", 461.41150616728106)]),
                    uses([
                      proof(goal(mission(mars_hohmann, centralBodyMu_km3_s2, 132712440018.0)), by(fact("orbital-transfer-design.pl", clause(8)))),
                      proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                      proof(
                        goal(semi_major_axis(mars_hohmann, 188768535.34999999)), by(rule("orbital-transfer-design.pl", clause(14))),
                        bindings([binding("Mission", mars_hohmann), binding("Axis", 188768535.34999999), binding("R1", 149597870.7), binding("R2", 227939200.0), binding("Sum", 377537070.69999999)]),
                        uses([
                          proof(goal(mission(mars_hohmann, departureOrbitRadius_km, 149597870.7)), by(fact("orbital-transfer-design.pl", clause(9)))),
                          proof(goal(mission(mars_hohmann, arrivalOrbitRadius_km, 227939200.0)), by(fact("orbital-transfer-design.pl", clause(10)))),
                          proof(goal(add(149597870.7, 227939200.0, 377537070.69999999)), by(builtin(add, 3))),
                          proof(goal(div(377537070.69999999, 2.0, 188768535.34999999)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(div(2.0, 227939200.0, 8.7742696297960164e-9)), by(builtin(div, 3))),
                      proof(goal(div(1.0, 188768535.34999999, 5.297493028411104e-9)), by(builtin(div, 3))),
                      proof(goal(sub(8.7742696297960164e-9, 5.297493028411104e-9, 3.4767766013849123e-9)), by(builtin(sub, 3))),
                      proof(goal(mul(132712440018.0, 3.4767766013849123e-9, 461.41150616728106)), by(builtin(mul, 3))),
                      proof(goal(pow(461.41150616728106, 0.5, 21.480491292502624)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(sub(24.129388014888221, 21.480491292502624, 2.6488967223855973)), by(builtin(sub, 3)))
                ])
              ),
              proof(goal(add(2.9446911328430403, 2.6488967223855973, 5.5935878552286376)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(mission(mars_hohmann, deltaVBudget_km_s, 6.0)), by(fact("orbital-transfer-design.pl", clause(11)))),
          proof(goal(le(5.5935878552286376, 6.0)), by(builtin(le, 2)))
        ])
      )
    ])
  )
).

