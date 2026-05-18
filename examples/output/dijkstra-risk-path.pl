triple(:Case, :notes, :riskCanOutweighRawCost).
triple(:Case, :selectedPath, :pathB).
triple(:Case, :trustGate, :noEnumeratedPathIsLower).
triple(:dijkstraRiskPath, :selects, :pathB).
triple(:pathB, :edgeCount, 2).
triple(:pathB, :rawCost, 8.0).
triple(:pathB, :riskSum, 0.5).
triple(:pathB, :route, [:DepotA, :DepotB, :LabD]).
triple(:pathB, :score, 13.0).
triple(:pathC, :edgeCount, 2).
triple(:pathC, :rawCost, 9.0).
triple(:pathC, :riskSum, 1.2).
triple(:pathC, :route, [:DepotA, :DepotC, :LabD]).
triple(:pathC, :score, 21.0).
triple(:pathDirectC, :edgeCount, 1).
triple(:pathDirectC, :rawCost, 14.0).
triple(:pathDirectC, :riskSum, 0.050000000000000003).
triple(:pathDirectC, :route, [:DepotA, :LabD]).
triple(:pathDirectC, :score, 14.5).
triple(:pathRelay, :edgeCount, 2).
triple(:pathRelay, :rawCost, 10.0).
triple(:pathRelay, :riskSum, 0.40000000000000002).
triple(:pathRelay, :route, [:DepotA, :Relay, :LabD]).
triple(:pathRelay, :score, 14.0).
triple(:pathViaC, :edgeCount, 3).
triple(:pathViaC, :rawCost, 7.5).
triple(:pathViaC, :riskSum, 1.7000000000000002).
triple(:pathViaC, :route, [:DepotA, :DepotC, :DepotB, :LabD]).
triple(:pathViaC, :score, 24.5).
