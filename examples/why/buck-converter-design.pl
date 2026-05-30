dutyCycle(regulator1, 0.20833333333333334).
why(
  dutyCycle(regulator1, 0.20833333333333334),
  proof(
    goal(dutyCycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(20))),
    bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334)]),
    uses([
      proof(
        goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
        bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
        uses([
          proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
          proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
          proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

inductorRipple_A(regulator1, 0.35984848484848486).
why(
  inductorRipple_A(regulator1, 0.35984848484848486),
  proof(
    goal(inductorRipple_A(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(21))),
    bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486)]),
    uses([
      proof(
        goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
        bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
        uses([
          proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
          proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
          proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
          proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
          proof(
            goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
            bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
            uses([
              proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
              proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
              proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
          proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
          proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
          proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

rippleRatio(regulator1, 0.17992424242424243).
why(
  rippleRatio(regulator1, 0.17992424242424243),
  proof(
    goal(rippleRatio(regulator1, 0.17992424242424243)), by(rule("buck-converter-design.pl", clause(22))),
    bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243)]),
    uses([
      proof(
        goal(ripple_ratio(regulator1, 0.17992424242424243)), by(rule("buck-converter-design.pl", clause(17))),
        bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243), binding("RippleCurrent", 0.35984848484848486), binding("LoadCurrent", 2.0)]),
        uses([
          proof(
            goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
            bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
            uses([
              proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
              proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
              proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
              proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
              proof(
                goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                uses([
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
              proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
              proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
              proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(converter(regulator1, loadCurrent_A, 2.0)), by(fact("buck-converter-design.pl", clause(9)))),
          proof(goal(div(0.35984848484848486, 2.0, 0.17992424242424243)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

capacitorRipple_V(regulator1, 0.0019140876853642812).
why(
  capacitorRipple_V(regulator1, 0.0019140876853642812),
  proof(
    goal(capacitorRipple_V(regulator1, 0.0019140876853642812)), by(rule("buck-converter-design.pl", clause(23))),
    bindings([binding("Converter", regulator1), binding("RippleVoltage", 0.0019140876853642812)]),
    uses([
      proof(
        goal(capacitor_ripple_voltage(regulator1, 0.0019140876853642812)), by(rule("buck-converter-design.pl", clause(18))),
        bindings([binding("Converter", regulator1), binding("RippleVoltage", 0.0019140876853642812), binding("RippleCurrent", 0.35984848484848486), binding("Frequency", 500000.0), binding("Capacitance", 0.000047), binding("EightF", 4000000.0), binding("Denominator", 188.0)]),
        uses([
          proof(
            goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
            bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
            uses([
              proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
              proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
              proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
              proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
              proof(
                goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                uses([
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
              proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
              proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
              proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
          proof(goal(converter(regulator1, capacitance_F, 0.000047)), by(fact("buck-converter-design.pl", clause(12)))),
          proof(goal(mul(8.0, 500000.0, 4000000.0)), by(builtin(mul, 3))),
          proof(goal(mul(4000000.0, 0.000047, 188.0)), by(builtin(mul, 3))),
          proof(goal(div(0.35984848484848486, 188.0, 0.0019140876853642812)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

status(regulator1, stable_ripple_design).
why(
  status(regulator1, stable_ripple_design),
  proof(
    goal(status(regulator1, stable_ripple_design)), by(rule("buck-converter-design.pl", clause(24))),
    bindings([binding("Converter", regulator1)]),
    uses([
      proof(
        goal(within_ripple_limits(regulator1)), by(rule("buck-converter-design.pl", clause(19))),
        bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243), binding("MaxRatio", 0.30), binding("RippleVoltage", 0.0019140876853642812), binding("MaxRippleVoltage", 0.05)]),
        uses([
          proof(
            goal(ripple_ratio(regulator1, 0.17992424242424243)), by(rule("buck-converter-design.pl", clause(17))),
            bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243), binding("RippleCurrent", 0.35984848484848486), binding("LoadCurrent", 2.0)]),
            uses([
              proof(
                goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
                bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
                uses([
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
                  proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
                  proof(
                    goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                    bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                    uses([
                      proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                      proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                      proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
                  proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
                  proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
                  proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(converter(regulator1, loadCurrent_A, 2.0)), by(fact("buck-converter-design.pl", clause(9)))),
              proof(goal(div(0.35984848484848486, 2.0, 0.17992424242424243)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(limit(regulator1, maxRippleRatio, 0.30)), by(fact("buck-converter-design.pl", clause(13)))),
          proof(goal(lt(0.17992424242424243, 0.30)), by(builtin(lt, 2))),
          proof(
            goal(capacitor_ripple_voltage(regulator1, 0.0019140876853642812)), by(rule("buck-converter-design.pl", clause(18))),
            bindings([binding("Converter", regulator1), binding("RippleVoltage", 0.0019140876853642812), binding("RippleCurrent", 0.35984848484848486), binding("Frequency", 500000.0), binding("Capacitance", 0.000047), binding("EightF", 4000000.0), binding("Denominator", 188.0)]),
            uses([
              proof(
                goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
                bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
                uses([
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
                  proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
                  proof(
                    goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                    bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                    uses([
                      proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                      proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                      proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
                  proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
                  proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
                  proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
              proof(goal(converter(regulator1, capacitance_F, 0.000047)), by(fact("buck-converter-design.pl", clause(12)))),
              proof(goal(mul(8.0, 500000.0, 4000000.0)), by(builtin(mul, 3))),
              proof(goal(mul(4000000.0, 0.000047, 188.0)), by(builtin(mul, 3))),
              proof(goal(div(0.35984848484848486, 188.0, 0.0019140876853642812)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(limit(regulator1, maxOutputRipple_V, 0.05)), by(fact("buck-converter-design.pl", clause(14)))),
          proof(goal(lt(0.0019140876853642812, 0.05)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

reason(regulator1, "inductor-current and output-voltage ripple are below design limits").
why(
  reason(regulator1, "inductor-current and output-voltage ripple are below design limits"),
  proof(
    goal(reason(regulator1, "inductor-current and output-voltage ripple are below design limits")), by(rule("buck-converter-design.pl", clause(25))),
    bindings([binding("Converter", regulator1)]),
    uses([
      proof(
        goal(within_ripple_limits(regulator1)), by(rule("buck-converter-design.pl", clause(19))),
        bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243), binding("MaxRatio", 0.30), binding("RippleVoltage", 0.0019140876853642812), binding("MaxRippleVoltage", 0.05)]),
        uses([
          proof(
            goal(ripple_ratio(regulator1, 0.17992424242424243)), by(rule("buck-converter-design.pl", clause(17))),
            bindings([binding("Converter", regulator1), binding("Ratio", 0.17992424242424243), binding("RippleCurrent", 0.35984848484848486), binding("LoadCurrent", 2.0)]),
            uses([
              proof(
                goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
                bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
                uses([
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
                  proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
                  proof(
                    goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                    bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                    uses([
                      proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                      proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                      proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
                  proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
                  proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
                  proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(converter(regulator1, loadCurrent_A, 2.0)), by(fact("buck-converter-design.pl", clause(9)))),
              proof(goal(div(0.35984848484848486, 2.0, 0.17992424242424243)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(limit(regulator1, maxRippleRatio, 0.30)), by(fact("buck-converter-design.pl", clause(13)))),
          proof(goal(lt(0.17992424242424243, 0.30)), by(builtin(lt, 2))),
          proof(
            goal(capacitor_ripple_voltage(regulator1, 0.0019140876853642812)), by(rule("buck-converter-design.pl", clause(18))),
            bindings([binding("Converter", regulator1), binding("RippleVoltage", 0.0019140876853642812), binding("RippleCurrent", 0.35984848484848486), binding("Frequency", 500000.0), binding("Capacitance", 0.000047), binding("EightF", 4000000.0), binding("Denominator", 188.0)]),
            uses([
              proof(
                goal(inductor_ripple_current(regulator1, 0.35984848484848486)), by(rule("buck-converter-design.pl", clause(16))),
                bindings([binding("Converter", regulator1), binding("RippleCurrent", 0.35984848484848486), binding("InputVoltage", 24.0), binding("OutputVoltage", 5.0), binding("Inductance", 0.000022), binding("Frequency", 500000.0), binding("Duty", 0.20833333333333334), binding("VoltageAcrossInductor", 19.0), binding("Numerator", 3.9583333333333335), binding("Denominator", 11.0)]),
                uses([
                  proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                  proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                  proof(goal(converter(regulator1, inductance_H, 0.000022)), by(fact("buck-converter-design.pl", clause(11)))),
                  proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
                  proof(
                    goal(duty_cycle(regulator1, 0.20833333333333334)), by(rule("buck-converter-design.pl", clause(15))),
                    bindings([binding("Converter", regulator1), binding("Duty", 0.20833333333333334), binding("OutputVoltage", 5.0), binding("InputVoltage", 24.0)]),
                    uses([
                      proof(goal(converter(regulator1, outputVoltage_V, 5.0)), by(fact("buck-converter-design.pl", clause(8)))),
                      proof(goal(converter(regulator1, inputVoltage_V, 24.0)), by(fact("buck-converter-design.pl", clause(7)))),
                      proof(goal(div(5.0, 24.0, 0.20833333333333334)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(sub(24.0, 5.0, 19.0)), by(builtin(sub, 3))),
                  proof(goal(mul(19.0, 0.20833333333333334, 3.9583333333333335)), by(builtin(mul, 3))),
                  proof(goal(mul(0.000022, 500000.0, 11.0)), by(builtin(mul, 3))),
                  proof(goal(div(3.9583333333333335, 11.0, 0.35984848484848486)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(converter(regulator1, switchingFrequency_Hz, 500000.0)), by(fact("buck-converter-design.pl", clause(10)))),
              proof(goal(converter(regulator1, capacitance_F, 0.000047)), by(fact("buck-converter-design.pl", clause(12)))),
              proof(goal(mul(8.0, 500000.0, 4000000.0)), by(builtin(mul, 3))),
              proof(goal(mul(4000000.0, 0.000047, 188.0)), by(builtin(mul, 3))),
              proof(goal(div(0.35984848484848486, 188.0, 0.0019140876853642812)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(limit(regulator1, maxOutputRipple_V, 0.05)), by(fact("buck-converter-design.pl", clause(14)))),
          proof(goal(lt(0.0019140876853642812, 0.05)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

