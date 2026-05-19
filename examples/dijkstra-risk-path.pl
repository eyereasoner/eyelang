% Risk-adjusted route selection adapted from Eyeling dijkstra-risk-path.n3.
% The score is raw delivery cost plus ten times the accumulated risk.
% Segments live in a quoted formula term, while candidate paths remain lists.

route_network(riskNetwork, (
  triple(depotA, segment, segment(depotB, 4.0, 0.2)),
  triple(depotB, segment, segment(labD, 4.0, 0.3)),
  triple(depotA, segment, segment(depotC, 3.0, 0.9)),
  triple(depotC, segment, segment(labD, 6.0, 0.3)),
  triple(depotC, segment, segment(depotB, 0.5, 0.5)),
  triple(depotB, segment, segment(depotC, 1.0, 0.5)),
  triple(depotA, segment, segment(relay, 5.0, 0.2)),
  triple(relay, segment, segment(labD, 5.0, 0.2)),
  triple(depotA, segment, segment(labD, 14.0, 0.05))
)).

route_segment(From, To, Raw, Risk) :-
  route_network(riskNetwork, Formula),
  formula_triple(Formula, From, segment, segment(To, Raw, Risk)).

candidate(pathB, [depotA, depotB, labD]).
candidate(pathC, [depotA, depotC, labD]).
candidate(pathRelay, [depotA, relay, labD]).
candidate(pathDirectC, [depotA, labD]).
candidate(pathViaC, [depotA, depotC, depotB, labD]).

route_cost([_], 0.0, 0.0, 0).
route_cost([From, To|Rest], Raw, Risk, Edges) :-
  route_segment(From, To, StepRaw, StepRisk),
  route_cost([To|Rest], RestRaw, RestRisk, RestEdges),
  add(StepRaw, RestRaw, Raw),
  add(StepRisk, RestRisk, Risk),
  add(1, RestEdges, Edges).

score(Raw, Risk, Score) :-
  mul(Risk, 10.0, Penalty),
  add(Raw, Penalty, Score).

path_metrics(Path, Route, Raw, Risk, Score, Edges) :-
  candidate(Path, Route),
  route_cost(Route, Raw, Risk, Edges),
  score(Raw, Risk, Score).

best_path(pathB) :-
  path_metrics(pathB, _BestRoute, _BestRaw, _BestRisk, BestScore, _BestEdges),
  path_metrics(pathC, _CRoute, _CRaw, _CRisk, CScore, _CEdges),
  path_metrics(pathRelay, _RRoute, _RRaw, _RRisk, RelayScore, _REdges),
  path_metrics(pathDirectC, _DRoute, _DRaw, _DRisk, DirectScore, _DEdges),
  path_metrics(pathViaC, _VRoute, _VRaw, _VRisk, ViaScore, _VEdges),
  lt(BestScore, CScore),
  lt(BestScore, RelayScore),
  lt(BestScore, DirectScore),
  lt(BestScore, ViaScore).

risk_outweighs_raw_cost(true) :-
  path_metrics(pathB, _BR, BestRaw, _BRS, BestScore, _BE),
  path_metrics(pathViaC, _VR, ViaRaw, _VRS, ViaScore, _VE),
  lt(ViaRaw, BestRaw),
  lt(BestScore, ViaScore).

triple(Path, route, Route) :- path_metrics(Path, Route, _Raw, _Risk, _Score, _Edges).
triple(Path, rawCost, Raw) :- path_metrics(Path, _Route, Raw, _Risk, _Score, _Edges).
triple(Path, riskSum, Risk) :- path_metrics(Path, _Route, _Raw, Risk, _Score, _Edges).
triple(Path, score, Score) :- path_metrics(Path, _Route, _Raw, _Risk, Score, _Edges).
triple(Path, edgeCount, Edges) :- path_metrics(Path, _Route, _Raw, _Risk, _Score, Edges).
triple(case, selectedPath, Path) :- best_path(Path).
triple(case, trustGate, noEnumeratedPathIsLower) :- best_path(_Path).
triple(case, notes, riskCanOutweighRawCost) :- risk_outweighs_raw_cost(true).
triple(dijkstraRiskPath, selects, Path) :- best_path(Path), risk_outweighs_raw_cost(true).
