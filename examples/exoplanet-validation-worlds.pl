% EYE reasoning-inspired example: exoplanet candidate validation worlds.
%
% Four simplified worlds classify candidate transit signals using either Bayes,
% sensitivity-only reasoning, a heuristic threshold, or a stricter Bayesian rule.

candidate(rare_wide_orbit, 0.001, 0.99, 0.99).
candidate(mstar_short_period, 0.20, 0.99, 0.99).
candidate(common_hot_neptune_good, 0.25, 0.95, 0.97).
candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90).

world(w0, full_bayes_reference).
world(w1, sensitivity_only_naive).
world(w2, occurrence_sensitivity_specificity_heuristic).
world(w3, cautious_bayes_threshold).

ppv_planet(Candidate, PPV) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  mul(Sensitivity, Occurrence, Numerator),
  sub(1.0, Occurrence, NoPlanetPrior),
  sub(1.0, Specificity, FalsePositiveRate),
  mul(FalsePositiveRate, NoPlanetPrior, FalsePositiveMass),
  add(Numerator, FalsePositiveMass, Denominator),
  div(Numerator, Denominator, PPV).

confirms_in_world(Candidate, w0) :-
  ppv_planet(Candidate, PPV),
  ge(PPV, 0.90).

rejects_in_world(Candidate, w0) :-
  ppv_planet(Candidate, PPV),
  lt(PPV, 0.90).

confirms_in_world(Candidate, w1) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  ge(Sensitivity, 0.95).

rejects_in_world(Candidate, w1) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  lt(Sensitivity, 0.95).

confirms_in_world(Candidate, w2) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  ge(Occurrence, 0.05),
  ge(Sensitivity, 0.90),
  ge(Specificity, 0.97).

rejects_in_world(Candidate, w2) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  lt(Occurrence, 0.05).

rejects_in_world(Candidate, w2) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  lt(Sensitivity, 0.90).

rejects_in_world(Candidate, w2) :-
  candidate(Candidate, Occurrence, Sensitivity, Specificity),
  lt(Specificity, 0.97).

confirms_in_world(Candidate, w3) :-
  ppv_planet(Candidate, PPV),
  ge(PPV, 0.93).

rejects_in_world(Candidate, w3) :-
  ppv_planet(Candidate, PPV),
  lt(PPV, 0.93).

pattern_matches(report) :-
  confirms_in_world(rare_wide_orbit, w1),
  rejects_in_world(rare_wide_orbit, w0), rejects_in_world(rare_wide_orbit, w2), rejects_in_world(rare_wide_orbit, w3),
  confirms_in_world(mstar_short_period, w0), confirms_in_world(mstar_short_period, w1), confirms_in_world(mstar_short_period, w2), confirms_in_world(mstar_short_period, w3),
  confirms_in_world(common_hot_neptune_good, w0), confirms_in_world(common_hot_neptune_good, w1), confirms_in_world(common_hot_neptune_good, w2), rejects_in_world(common_hot_neptune_good, w3),
  confirms_in_world(common_hot_neptune_low_spec, w1),
  rejects_in_world(common_hot_neptune_low_spec, w0), rejects_in_world(common_hot_neptune_low_spec, w2), rejects_in_world(common_hot_neptune_low_spec, w3).

triple(Candidate, ppvPlanetGivenDetection, PPV) :- ppv_planet(Candidate, PPV).
triple(Candidate, confirmsInWorld, World) :- confirms_in_world(Candidate, World).
triple(Candidate, rejectsInWorld, World) :- rejects_in_world(Candidate, World).
triple(exoplanet_validation_worlds, status, expected_world_pattern) :- pattern_matches(report).
triple(exoplanet_validation_worlds, reason, "Bayesian worlds account for occurrence and false positives while the naive world trusts sensitivity alone") :- pattern_matches(report).
