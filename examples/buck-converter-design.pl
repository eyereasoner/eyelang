% Engineering example: buck-converter ripple check.
%
% A simplified continuous-conduction buck converter model computes duty cycle,
% inductor ripple current, capacitor ripple voltage, and checks design limits.

converter(regulator1, inputVoltage_V, 24.0).
converter(regulator1, outputVoltage_V, 5.0).
converter(regulator1, loadCurrent_A, 2.0).
converter(regulator1, switchingFrequency_Hz, 500000.0).
converter(regulator1, inductance_H, 0.000022).
converter(regulator1, capacitance_F, 0.000047).
limit(regulator1, maxRippleRatio, 0.30).
limit(regulator1, maxOutputRipple_V, 0.05).

duty_cycle(Converter, Duty) :-
  converter(Converter, outputVoltage_V, OutputVoltage),
  converter(Converter, inputVoltage_V, InputVoltage),
  div(OutputVoltage, InputVoltage, Duty).

inductor_ripple_current(Converter, RippleCurrent) :-
  converter(Converter, inputVoltage_V, InputVoltage),
  converter(Converter, outputVoltage_V, OutputVoltage),
  converter(Converter, inductance_H, Inductance),
  converter(Converter, switchingFrequency_Hz, Frequency),
  duty_cycle(Converter, Duty),
  sub(InputVoltage, OutputVoltage, VoltageAcrossInductor),
  mul(VoltageAcrossInductor, Duty, Numerator),
  mul(Inductance, Frequency, Denominator),
  div(Numerator, Denominator, RippleCurrent).

ripple_ratio(Converter, Ratio) :-
  inductor_ripple_current(Converter, RippleCurrent),
  converter(Converter, loadCurrent_A, LoadCurrent),
  div(RippleCurrent, LoadCurrent, Ratio).

capacitor_ripple_voltage(Converter, RippleVoltage) :-
  inductor_ripple_current(Converter, RippleCurrent),
  converter(Converter, switchingFrequency_Hz, Frequency),
  converter(Converter, capacitance_F, Capacitance),
  mul(8.0, Frequency, EightF),
  mul(EightF, Capacitance, Denominator),
  div(RippleCurrent, Denominator, RippleVoltage).

within_ripple_limits(Converter) :-
  ripple_ratio(Converter, Ratio),
  limit(Converter, maxRippleRatio, MaxRatio),
  lt(Ratio, MaxRatio),
  capacitor_ripple_voltage(Converter, RippleVoltage),
  limit(Converter, maxOutputRipple_V, MaxRippleVoltage),
  lt(RippleVoltage, MaxRippleVoltage).

triple(Converter, dutyCycle, Duty) :-
  duty_cycle(Converter, Duty).

triple(Converter, inductorRipple_A, RippleCurrent) :-
  inductor_ripple_current(Converter, RippleCurrent).

triple(Converter, rippleRatio, Ratio) :-
  ripple_ratio(Converter, Ratio).

triple(Converter, capacitorRipple_V, RippleVoltage) :-
  capacitor_ripple_voltage(Converter, RippleVoltage).

triple(Converter, status, stable_ripple_design) :-
  within_ripple_limits(Converter).

triple(Converter, reason, "inductor-current and output-voltage ripple are below design limits") :-
  within_ripple_limits(Converter).
