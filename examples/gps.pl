% Memoize route paths because the same candidate routes are checked repeatedly
% for explanation and verification triples.
memoize(path, 7).
memoize(traveller_path, 6).

% GPS — ARC-style goal-driven route planning, translated from Eyeling's gps.n3.
%
% The map is kept as quoted formula data.  Rules project gps_description
% statements from that formula, chain them into paths, compare the two complete
% routes from Gent to Oostende, and produce a compact explanation report.

case_graph(caseGraph, (
  triple(i1, location, gent),
  triple(question, text, "Which route should we take from Gent to Oostende?"),
  triple(routeDirect, label, "Gent -> Brugge -> Oostende"),
  triple(routeViaKortrijk, label, "Gent -> Kortrijk -> Brugge -> Oostende")
)).

map_graph(mapBE, (
  triple(mapBE, gps_description, description(triple(S, location, gent), true, triple(S, location, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)),
  triple(mapBE, gps_description, description(triple(S, location, gent), true, triple(S, location, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)),
  triple(mapBE, gps_description, description(triple(S, location, kortrijk), true, triple(S, location, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)),
  triple(mapBE, gps_description, description(triple(S, location, brugge), true, triple(S, location, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))
)).

case_triple(S, P, O) :-
  case_graph(caseGraph, Formula),
  formula_triple(Formula, S, P, O).

map_description(From, To, Action, Duration, Cost, Belief, Comfort) :-
  map_graph(mapBE, Formula),
  formula_triple(Formula, mapBE, gps_description, description(From, true, To, Action, Duration, Cost, Belief, Comfort)).

path(From, To, [Action], Duration, Cost, Belief, Comfort) :-
  map_description(From, To, Action, Duration, Cost, Belief, Comfort).

path(From, To, Actions, Duration, Cost, Belief, Comfort) :-
  map_description(From, Mid, Action, D1, C1, B1, F1),
  path(Mid, To, RestActions, D2, C2, B2, F2),
  append([Action], RestActions, Actions),
  add(D1, D2, Duration),
  add(C1, C2, Cost),
  mul(B1, B2, Belief),
  mul(F1, F2, Comfort).

traveller_start(i1, triple(i1, location, gent)).
traveller_goal(i1, triple(i1, location, oostende)).

traveller_path(Traveller, Actions, Duration, Cost, Belief, Comfort) :-
  traveller_start(Traveller, From),
  traveller_goal(Traveller, To),
  path(From, To, Actions, Duration, Cost, Belief, Comfort).

route_metrics(routeDirect, Duration, Cost, Belief, Comfort) :-
  traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], Duration, Cost, Belief, Comfort).

route_metrics(routeViaKortrijk, Duration, Cost, Belief, Comfort) :-
  traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], Duration, Cost, Belief, Comfort).

recommended_route(routeDirect) :-
  route_metrics(routeDirect, DirectDuration, DirectCost, DirectBelief, DirectComfort),
  route_metrics(routeViaKortrijk, ViaDuration, ViaCost, ViaBelief, ViaComfort),
  lt(DirectDuration, ViaDuration),
  lt(DirectCost, ViaCost),
  gt(DirectBelief, ViaBelief),
  gt(DirectComfort, ViaComfort).

outcome(routeDirect, "Take the direct route via Brugge.").

% Verification checks, analogous to the false-producing guards in gps.n3.
check(c1, true) :-
  traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], _, _, _, _).

check(c2, true) :-
  traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], _, _, _, _).

check(c3, true) :-
  route_metrics(routeDirect, D1, _, _, _),
  route_metrics(routeViaKortrijk, D2, _, _, _),
  lt(D1, D2).

check(c4, true) :-
  route_metrics(routeDirect, _, C1, _, _),
  route_metrics(routeViaKortrijk, _, C2, _, _),
  lt(C1, C2).

check(c5, true) :-
  route_metrics(routeDirect, _, _, B1, F1),
  route_metrics(routeViaKortrijk, _, _, B2, F2),
  gt(B1, B2),
  gt(F1, F2).

triple(decision, recommendedRoute, Route) :-
  recommended_route(Route).

triple(decision, outcome, Outcome) :-
  recommended_route(Route),
  outcome(Route, Outcome).

triple(check, Check, true) :-
  check(Check, true).

route_actions(routeDirect, [drive_gent_brugge, drive_brugge_oostende]).
route_actions(routeViaKortrijk, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]).

% Derived route and report triples.  These are consequences of the route search
% and comparison, not pre-written markdown output.
triple(Route, label, Label) :-
  case_triple(Route, label, Label),
  route_metrics(Route, _Duration, _Cost, _Belief, _Comfort).

triple(Route, actionSequence, Actions) :-
  route_actions(Route, Actions),
  route_metrics(Route, _Duration, _Cost, _Belief, _Comfort).

triple(Route, durationSeconds, Duration) :-
  route_metrics(Route, Duration, _Cost, _Belief, _Comfort).

triple(Route, cost, Cost) :-
  route_metrics(Route, _Duration, Cost, _Belief, _Comfort).

triple(Route, belief, Belief) :-
  route_metrics(Route, _Duration, _Cost, Belief, _Comfort).

triple(Route, comfort, Comfort) :-
  route_metrics(Route, _Duration, _Cost, _Belief, Comfort).

triple(report, selectedRoute, route(Route, Actions, Duration, Cost, Belief, Comfort)) :-
  recommended_route(Route),
  route_actions(Route, Actions),
  route_metrics(Route, Duration, Cost, Belief, Comfort).

triple(report, comparison, dominates(routeDirect, routeViaKortrijk)) :-
  recommended_route(routeDirect),
  check(c3, true),
  check(c4, true),
  check(c5, true).
