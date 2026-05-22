% Science example: competitive enzyme inhibition.
%
% Michaelis-Menten kinetics with a competitive inhibitor:
%   Km_effective = Km * (1 + Inhibitor / Ki)
%   rate = Vmax * Substrate / (Km_effective + Substrate)

assay(assay1, vmax_uM_s, 120.0).
assay(assay1, substrate_uM, 50.0).
assay(assay1, km_uM, 30.0).
assay(assay1, inhibitor_uM, 10.0).
assay(assay1, ki_uM, 5.0).
threshold(assay1, significant_inhibition_fraction, 0.25).

competitive_multiplier(Assay, Multiplier) :-
  assay(Assay, inhibitor_uM, Inhibitor),
  assay(Assay, ki_uM, Ki),
  div(Inhibitor, Ki, Ratio),
  add(1.0, Ratio, Multiplier).

effective_km(Assay, EffectiveKm) :-
  assay(Assay, km_uM, Km),
  competitive_multiplier(Assay, Multiplier),
  mul(Km, Multiplier, EffectiveKm).

uninhibited_rate(Assay, Rate) :-
  assay(Assay, vmax_uM_s, Vmax),
  assay(Assay, substrate_uM, Substrate),
  assay(Assay, km_uM, Km),
  mul(Vmax, Substrate, Numerator),
  add(Km, Substrate, Denominator),
  div(Numerator, Denominator, Rate).

inhibited_rate(Assay, Rate) :-
  assay(Assay, vmax_uM_s, Vmax),
  assay(Assay, substrate_uM, Substrate),
  effective_km(Assay, EffectiveKm),
  mul(Vmax, Substrate, Numerator),
  add(EffectiveKm, Substrate, Denominator),
  div(Numerator, Denominator, Rate).

inhibition_fraction(Assay, Fraction) :-
  uninhibited_rate(Assay, Uninhibited),
  inhibited_rate(Assay, Inhibited),
  sub(Uninhibited, Inhibited, Delta),
  div(Delta, Uninhibited, Fraction).

significant_inhibition(Assay) :-
  inhibition_fraction(Assay, Fraction),
  threshold(Assay, significant_inhibition_fraction, Limit),
  gt(Fraction, Limit).

triple(Assay, effectiveKm_uM, EffectiveKm) :-
  effective_km(Assay, EffectiveKm).

triple(Assay, uninhibitedRate_uM_s, Rate) :-
  uninhibited_rate(Assay, Rate).

triple(Assay, inhibitedRate_uM_s, Rate) :-
  inhibited_rate(Assay, Rate).

triple(Assay, inhibitionFraction, Fraction) :-
  inhibition_fraction(Assay, Fraction).

triple(Assay, status, significant_inhibition) :-
  significant_inhibition(Assay).

triple(Assay, reason, "competitive inhibitor raises effective Km and lowers reaction rate") :-
  significant_inhibition(Assay).
