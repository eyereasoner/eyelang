// Runtime table-cache lifecycle adapter for library(tabling).

function* abolishAllTablesBuiltin({ solver, env }) {
  solver.memo.clear();
  solver.subsumptiveMemo.clear();
  solver.wfsModels.clear();
  solver.datalogModels.clear();
  solver.tableCoordinator = null;
  solver.groundChainSuccess.clear();
  solver.compactChainSuccess.clear();
  for (const scope of solver.innerTableScopes.values()) {
    scope.memo.clear();
    scope.subsumptiveMemo.clear();
  }
  yield env;
}

export const tablingHostBuiltins = {
  register(registry) {
    registry.add('eyeprolog__abolish_all_tables', 0, abolishAllTablesBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};
