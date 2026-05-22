% EYE-inspired field nitrogen balance case study.
% Fields are classified from soil N, fertilizer N, losses, and crop demand.

% field(Field, SoilN, FertilizerN, LossFraction, CropDemandN).
field(low_input, 25, 40, 0.10, 110).
field(balanced_loam, 45, 80, 0.12, 110).
field(sandy_high, 30, 150, 0.35, 105).
field(clay_surplus, 70, 90, 0.08, 120).

total_n(F, Total) :-
  field(F, Soil, Fert, _, _),
  add(Soil, Fert, Total).

available_n(F, Avail) :-
  total_n(F, Total),
  field(F, _, _, Loss, _),
  sub(1.0, Loss, Retained),
  mul(Total, Retained, Avail).

surplus_n(F, Surplus) :-
  available_n(F, Avail),
  field(F, _, _, _, Demand),
  gt(Avail, Demand),
  sub(Avail, Demand, Surplus).

surplus_n(F, 0.0) :-
  available_n(F, Avail),
  field(F, _, _, _, Demand),
  le(Avail, Demand).

deficit_n(F, Deficit) :-
  available_n(F, Avail),
  field(F, _, _, _, Demand),
  lt(Avail, Demand),
  sub(Demand, Avail, Deficit).

deficit_n(F, 0.0) :-
  available_n(F, Avail),
  field(F, _, _, _, Demand),
  ge(Avail, Demand).

leaching_index(F, Index) :-
  surplus_n(F, Surplus),
  field(F, _, _, Loss, _),
  mul(Surplus, Loss, Index).

status(F, under_supplied) :- deficit_n(F, D), gt(D, 10.0).
status(F, balanced) :- deficit_n(F, D), surplus_n(F, S), le(D, 10.0), le(S, 10.0).
status(F, over_supplied) :- surplus_n(F, S), gt(S, 10.0).

triple(F, availableN_kg_ha, A) :- available_n(F, A).
triple(F, deficitN_kg_ha, D) :- deficit_n(F, D).
triple(F, surplusN_kg_ha, S) :- surplus_n(F, S).
triple(F, leachingIndex, I) :- leaching_index(F, I).
triple(F, status, S) :- status(F, S).
triple(field_nitrogen_balance, highestLeachingRisk, sandy_high) :-
  leaching_index(sandy_high, Sandy),
  leaching_index(clay_surplus, Clay),
  gt(Sandy, Clay).
triple(field_nitrogen_balance, reason, "available nitrogen is total input retained after losses compared with crop demand").
