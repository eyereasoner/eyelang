% Explainable charger configuration for a small depot catalog.
%
% The same relational model answers what fits, why an option fails, and what
% would need to change. A power-upgrade counterfactual rechecks all the other
% requirements. It gives the minimum extra site power for that fixed charger.
% Replacement suggestions identify requirements to recheck on the replacement;
% they do not assert that the original hardware can be modified accordingly.
% Catalog values and purchase costs in cents are illustrative supplied data.

site(depot_a, 60, 22, ccs2, three_phase).
% charger(Name, ChargeKw, SiteRequirementKw, Connector, Supply, CostCents).
charger(fleet22, 22, 45, ccs2, three_phase, 600000).
charger(rapid50, 50, 80, ccs2, three_phase, 900000).
charger(budget11, 11, 25, ccs2, three_phase, 220000).
charger(legacy22, 22, 45, type2, three_phase, 350000).

blocker(Site, Product, insufficient_site_power(Available, Needed)) :-
  site(Site, Available, _, _, _), charger(Product, _, Needed, _, _, _), Available < Needed.
blocker(Site, Product, insufficient_charge_rate(Offered, Required)) :-
  site(Site, _, Required, _, _), charger(Product, Offered, _, _, _, _), Offered < Required.
blocker(Site, Product, connector_mismatch(Offered, Required)) :-
  site(Site, _, _, Required, _), charger(Product, _, _, Offered, _, _), Offered \= Required.
blocker(Site, Product, supply_mismatch(Offered, Required)) :-
  site(Site, _, _, _, Required), charger(Product, _, _, _, Offered, _), Offered \= Required.
has_blocker(Site, Product) :- blocker(Site, Product, _).
compatible(Site, Product) :- site(Site, _, _, _, _), charger(Product, _, _, _, _, _), \+ has_blocker(Site, Product).
priced_option(Site, Product, Cost) :- compatible(Site, Product), charger(Product, _, _, _, _, Cost).
recommendation(Site, Product) :-
  site(Site, _, _, _, _),
  aggregate_all(min(Cost), priced_option(Site, Candidate, Cost), Minimum),
  priced_option(Site, Product, Minimum).

required_change(Site, Product, increase_site_power_to(Needed)) :-
  blocker(Site, Product, insufficient_site_power(_, Needed)).
required_change(Site, Product, choose_charger_at_least_kw(Required)) :-
  blocker(Site, Product, insufficient_charge_rate(_, Required)).
required_change(Site, Product, choose_connector(Required)) :-
  blocker(Site, Product, connector_mismatch(_, Required)).
required_change(Site, Product, choose_supply(Required)) :-
  blocker(Site, Product, supply_mismatch(_, Required)).

power_upgrade(Site, Product, ExtraKw) :-
  site(Site, Available, RequiredCharge, Connector, Supply),
  charger(Product, OfferedCharge, Needed, Connector, Supply, _),
  OfferedCharge >= RequiredCharge,
  Needed > Available,
  ExtraKw is Needed - Available.

% Answer and Reason
?- recommendation(Site, Product).
?- why.
?- blocker(Site, Product, Reason).
?- required_change(Site, Product, Change).
?- power_upgrade(Site, Product, ExtraKw).
?- why.

% Check
:- assertion(recommendation(depot_a, fleet22)).
:- assertion(blocker(depot_a, rapid50, insufficient_site_power(60, 80))).
:- assertion(blocker(depot_a, budget11, insufficient_charge_rate(11, 22))).
:- assertion(blocker(depot_a, legacy22, connector_mismatch(type2, ccs2))).
:- assertion(power_upgrade(depot_a, rapid50, 20)).
:- assertion(\+ power_upgrade(depot_a, budget11, 0)).
:- assertion(aggregate_all(count, compatible(Site, Product), 1)).
:- assertion(aggregate_all(count, blocker(Site, Product, Reason), 3)).
