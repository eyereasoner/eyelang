% Risk-adjusted route selection adapted from Eyeling dijkstra-risk-path.n3.
% The score is raw delivery cost plus ten times the accumulated risk.
% Segments live in a quoted graph term, while candidate paths remain lists.

route_network(:RiskNetwork, graph([
  triple(:DepotA, :segment, segment(:DepotB, 4.0, 0.2)),
  triple(:DepotB, :segment, segment(:LabD, 4.0, 0.3)),
  triple(:DepotA, :segment, segment(:DepotC, 3.0, 0.9)),
  triple(:DepotC, :segment, segment(:LabD, 6.0, 0.3)),
  triple(:DepotC, :segment, segment(:DepotB, 0.5, 0.5)),
  triple(:DepotB, :segment, segment(:DepotC, 1.0, 0.5)),
  triple(:DepotA, :segment, segment(:Relay, 5.0, 0.2)),
  triple(:Relay, :segment, segment(:LabD, 5.0, 0.2)),
  triple(:DepotA, :segment, segment(:LabD, 14.0, 0.05))
])).

graph_triple(graph(Statements), S, P, O) :- member(triple(S, P, O), Statements).

route_segment(From, To, Raw, Risk) :-
  route_network(:RiskNetwork, Graph),
  graph_triple(Graph, From, :segment, segment(To, Raw, Risk)).

candidate(:pathB, [:DepotA, :DepotB, :LabD]).
candidate(:pathC, [:DepotA, :DepotC, :LabD]).
candidate(:pathRelay, [:DepotA, :Relay, :LabD]).
candidate(:pathDirectC, [:DepotA, :LabD]).
candidate(:pathViaC, [:DepotA, :DepotC, :DepotB, :LabD]).

route_cost([_], 0.0, 0.0, 0).
route_cost([From, To|Rest], Raw, Risk, Edges) :-
  route_segment(From, To, StepRaw, StepRisk),
  route_cost([To|Rest], RestRaw, RestRisk, RestEdges),
  math:sum(StepRaw, RestRaw, Raw),
  math:sum(StepRisk, RestRisk, Risk),
  add(1, RestEdges, Edges).

score(Raw, Risk, Score) :-
  math:product(Risk, 10.0, Penalty),
  math:sum(Raw, Penalty, Score).

path_metrics(Path, Route, Raw, Risk, Score, Edges) :-
  candidate(Path, Route),
  route_cost(Route, Raw, Risk, Edges),
  score(Raw, Risk, Score).

best_path(:pathB) :-
  path_metrics(:pathB, _BestRoute, _BestRaw, _BestRisk, BestScore, _BestEdges),
  path_metrics(:pathC, _CRoute, _CRaw, _CRisk, CScore, _CEdges),
  path_metrics(:pathRelay, _RRoute, _RRaw, _RRisk, RelayScore, _REdges),
  path_metrics(:pathDirectC, _DRoute, _DRaw, _DRisk, DirectScore, _DEdges),
  path_metrics(:pathViaC, _VRoute, _VRaw, _VRisk, ViaScore, _VEdges),
  math:lessThan(BestScore, CScore),
  math:lessThan(BestScore, RelayScore),
  math:lessThan(BestScore, DirectScore),
  math:lessThan(BestScore, ViaScore).

risk_outweighs_raw_cost(true) :-
  path_metrics(:pathB, _BR, BestRaw, _BRS, BestScore, _BE),
  path_metrics(:pathViaC, _VR, ViaRaw, _VRS, ViaScore, _VE),
  math:lessThan(ViaRaw, BestRaw),
  math:lessThan(BestScore, ViaScore).

triple(Path, :route, Route) :- path_metrics(Path, Route, _Raw, _Risk, _Score, _Edges).
triple(Path, :rawCost, Raw) :- path_metrics(Path, _Route, Raw, _Risk, _Score, _Edges).
triple(Path, :riskSum, Risk) :- path_metrics(Path, _Route, _Raw, Risk, _Score, _Edges).
triple(Path, :score, Score) :- path_metrics(Path, _Route, _Raw, _Risk, Score, _Edges).
triple(Path, :edgeCount, Edges) :- path_metrics(Path, _Route, _Raw, _Risk, _Score, Edges).
triple(:Case, :selectedPath, Path) :- best_path(Path).
triple(:Case, :trustGate, :noEnumeratedPathIsLower) :- best_path(_Path).
triple(:Case, :notes, :riskCanOutweighRawCost) :- risk_outweighs_raw_cost(true).
triple(:dijkstraRiskPath, :selects, Path) :- best_path(Path), risk_outweighs_raw_cost(true).
