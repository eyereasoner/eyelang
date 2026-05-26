edgeCount(pathB, 2).
edgeCount(pathC, 2).
edgeCount(pathDirectC, 1).
edgeCount(pathRelay, 2).
edgeCount(pathViaC, 3).
notes(case, riskCanOutweighRawCost).
rawCost(pathB, 8.0).
rawCost(pathC, 9.0).
rawCost(pathDirectC, 14.0).
rawCost(pathRelay, 10.0).
rawCost(pathViaC, 7.5).
riskSum(pathB, 0.5).
riskSum(pathC, 1.2).
riskSum(pathDirectC, 0.050000000000000003).
riskSum(pathRelay, 0.40000000000000002).
riskSum(pathViaC, 1.7000000000000002).
route(pathB, [depotA, depotB, labD]).
route(pathC, [depotA, depotC, labD]).
route(pathDirectC, [depotA, labD]).
route(pathRelay, [depotA, relay, labD]).
route(pathViaC, [depotA, depotC, depotB, labD]).
score(pathB, 13.0).
score(pathC, 21.0).
score(pathDirectC, 14.5).
score(pathRelay, 14.0).
score(pathViaC, 24.5).
selectedPath(case, pathB).
selects(dijkstraRiskPath, pathB).
trustGate(case, noEnumeratedPathIsLower).
