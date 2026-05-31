renewablePower_kW(campus_interval_17, 270.0).
why(
  renewablePower_kW(campus_interval_17, 270.0),
  proof(
    goal(renewablePower_kW(campus_interval_17, 270.0)),
    by(rule("microgrid-dispatch.pl", clause(23))),
    bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0)]),
    uses([
      proof(
        goal(renewable_kW(campus_interval_17, 270.0)),
        by(rule("microgrid-dispatch.pl", clause(14))),
        bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
        uses([
          proof(
            goal(solar_kW(campus_interval_17, 180.0)),
            by(fact("microgrid-dispatch.pl", clause(9)))
          ),
          proof(
            goal(wind_kW(campus_interval_17, 90.0)),
            by(fact("microgrid-dispatch.pl", clause(10)))
          ),
          proof(
            goal(add(180.0, 90.0, 270.0)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

batteryDispatch_kW(campus_interval_17, 240.0).
why(
  batteryDispatch_kW(campus_interval_17, 240.0),
  proof(
    goal(batteryDispatch_kW(campus_interval_17, 240.0)),
    by(rule("microgrid-dispatch.pl", clause(24))),
    bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0)]),
    uses([
      proof(
        goal(battery_dispatch_kW(campus_interval_17, 240.0)),
        by(rule("microgrid-dispatch.pl", clause(17))),
        bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
        uses([
          proof(
            goal(net_deficit_kW(campus_interval_17, 350.0)),
            by(rule("microgrid-dispatch.pl", clause(15))),
            bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
            uses([
              proof(
                goal(load_kW(campus_interval_17, 620.0)),
                by(fact("microgrid-dispatch.pl", clause(8)))
              ),
              proof(
                goal(renewable_kW(campus_interval_17, 270.0)),
                by(rule("microgrid-dispatch.pl", clause(14))),
                bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                uses([
                  proof(
                    goal(solar_kW(campus_interval_17, 180.0)),
                    by(fact("microgrid-dispatch.pl", clause(9)))
                  ),
                  proof(
                    goal(wind_kW(campus_interval_17, 90.0)),
                    by(fact("microgrid-dispatch.pl", clause(10)))
                  ),
                  proof(
                    goal(add(180.0, 90.0, 270.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(sub(620.0, 270.0, 350.0)),
                by(builtin(sub, 3))
              )
            ])
          ),
          proof(
            goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
            by(rule("microgrid-dispatch.pl", clause(16))),
            bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
            uses([
              proof(
                goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                by(fact("microgrid-dispatch.pl", clause(11)))
              ),
              proof(
                goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                by(fact("microgrid-dispatch.pl", clause(12)))
              ),
              proof(
                goal(sub(320.0, 80.0, 240.0)),
                by(builtin(sub, 3))
              )
            ])
          ),
          proof(
            goal(min(350.0, 240.0, 240.0)),
            by(builtin(min, 3))
          )
        ])
      )
    ])
  )
).

gridImport_kW(campus_interval_17, 110.0).
why(
  gridImport_kW(campus_interval_17, 110.0),
  proof(
    goal(gridImport_kW(campus_interval_17, 110.0)),
    by(rule("microgrid-dispatch.pl", clause(25))),
    bindings([binding("Site", campus_interval_17), binding("Import", 110.0)]),
    uses([
      proof(
        goal(grid_import_kW(campus_interval_17, 110.0)),
        by(rule("microgrid-dispatch.pl", clause(18))),
        bindings([binding("Site", campus_interval_17), binding("Import", 110.0), binding("Deficit", 350.0), binding("Dispatch", 240.0)]),
        uses([
          proof(
            goal(net_deficit_kW(campus_interval_17, 350.0)),
            by(rule("microgrid-dispatch.pl", clause(15))),
            bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
            uses([
              proof(
                goal(load_kW(campus_interval_17, 620.0)),
                by(fact("microgrid-dispatch.pl", clause(8)))
              ),
              proof(
                goal(renewable_kW(campus_interval_17, 270.0)),
                by(rule("microgrid-dispatch.pl", clause(14))),
                bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                uses([
                  proof(
                    goal(solar_kW(campus_interval_17, 180.0)),
                    by(fact("microgrid-dispatch.pl", clause(9)))
                  ),
                  proof(
                    goal(wind_kW(campus_interval_17, 90.0)),
                    by(fact("microgrid-dispatch.pl", clause(10)))
                  ),
                  proof(
                    goal(add(180.0, 90.0, 270.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(sub(620.0, 270.0, 350.0)),
                by(builtin(sub, 3))
              )
            ])
          ),
          proof(
            goal(battery_dispatch_kW(campus_interval_17, 240.0)),
            by(rule("microgrid-dispatch.pl", clause(17))),
            bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
            uses([
              proof(
                goal(net_deficit_kW(campus_interval_17, 350.0)),
                by(rule("microgrid-dispatch.pl", clause(15))),
                bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                uses([
                  proof(
                    goal(load_kW(campus_interval_17, 620.0)),
                    by(fact("microgrid-dispatch.pl", clause(8)))
                  ),
                  proof(
                    goal(renewable_kW(campus_interval_17, 270.0)),
                    by(rule("microgrid-dispatch.pl", clause(14))),
                    bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                    uses([
                      proof(
                        goal(solar_kW(campus_interval_17, 180.0)),
                        by(fact("microgrid-dispatch.pl", clause(9)))
                      ),
                      proof(
                        goal(wind_kW(campus_interval_17, 90.0)),
                        by(fact("microgrid-dispatch.pl", clause(10)))
                      ),
                      proof(
                        goal(add(180.0, 90.0, 270.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(620.0, 270.0, 350.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                by(rule("microgrid-dispatch.pl", clause(16))),
                bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                uses([
                  proof(
                    goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                    by(fact("microgrid-dispatch.pl", clause(11)))
                  ),
                  proof(
                    goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                    by(fact("microgrid-dispatch.pl", clause(12)))
                  ),
                  proof(
                    goal(sub(320.0, 80.0, 240.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(min(350.0, 240.0, 240.0)),
                by(builtin(min, 3))
              )
            ])
          ),
          proof(
            goal(sub(350.0, 240.0, 110.0)),
            by(builtin(sub, 3))
          )
        ])
      )
    ])
  )
).

reserveAfterDispatch_kW(campus_interval_17, 80.0).
why(
  reserveAfterDispatch_kW(campus_interval_17, 80.0),
  proof(
    goal(reserveAfterDispatch_kW(campus_interval_17, 80.0)),
    by(rule("microgrid-dispatch.pl", clause(26))),
    bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0)]),
    uses([
      proof(
        goal(battery_reserve_after_dispatch_kW(campus_interval_17, 80.0)),
        by(rule("microgrid-dispatch.pl", clause(19))),
        bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0), binding("MaxDischarge", 320.0), binding("Dispatch", 240.0)]),
        uses([
          proof(
            goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
            by(fact("microgrid-dispatch.pl", clause(11)))
          ),
          proof(
            goal(battery_dispatch_kW(campus_interval_17, 240.0)),
            by(rule("microgrid-dispatch.pl", clause(17))),
            bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
            uses([
              proof(
                goal(net_deficit_kW(campus_interval_17, 350.0)),
                by(rule("microgrid-dispatch.pl", clause(15))),
                bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                uses([
                  proof(
                    goal(load_kW(campus_interval_17, 620.0)),
                    by(fact("microgrid-dispatch.pl", clause(8)))
                  ),
                  proof(
                    goal(renewable_kW(campus_interval_17, 270.0)),
                    by(rule("microgrid-dispatch.pl", clause(14))),
                    bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                    uses([
                      proof(
                        goal(solar_kW(campus_interval_17, 180.0)),
                        by(fact("microgrid-dispatch.pl", clause(9)))
                      ),
                      proof(
                        goal(wind_kW(campus_interval_17, 90.0)),
                        by(fact("microgrid-dispatch.pl", clause(10)))
                      ),
                      proof(
                        goal(add(180.0, 90.0, 270.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(620.0, 270.0, 350.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                by(rule("microgrid-dispatch.pl", clause(16))),
                bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                uses([
                  proof(
                    goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                    by(fact("microgrid-dispatch.pl", clause(11)))
                  ),
                  proof(
                    goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                    by(fact("microgrid-dispatch.pl", clause(12)))
                  ),
                  proof(
                    goal(sub(320.0, 80.0, 240.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(min(350.0, 240.0, 240.0)),
                by(builtin(min, 3))
              )
            ])
          ),
          proof(
            goal(sub(320.0, 240.0, 80.0)),
            by(builtin(sub, 3))
          )
        ])
      )
    ])
  )
).

status(campus_interval_17, stable_dispatch).
why(
  status(campus_interval_17, stable_dispatch),
  proof(
    goal(status(campus_interval_17, stable_dispatch)),
    by(rule("microgrid-dispatch.pl", clause(27))),
    bindings([binding("Site", campus_interval_17)]),
    uses([
      proof(
        goal(stable_dispatch(campus_interval_17)),
        by(rule("microgrid-dispatch.pl", clause(22))),
        bindings([binding("Site", campus_interval_17)]),
        uses([
          proof(
            goal(contract_ok(campus_interval_17)),
            by(rule("microgrid-dispatch.pl", clause(20))),
            bindings([binding("Site", campus_interval_17), binding("Import", 110.0), binding("Limit", 150.0)]),
            uses([
              proof(
                goal(grid_import_kW(campus_interval_17, 110.0)),
                by(rule("microgrid-dispatch.pl", clause(18))),
                bindings([binding("Site", campus_interval_17), binding("Import", 110.0), binding("Deficit", 350.0), binding("Dispatch", 240.0)]),
                uses([
                  proof(
                    goal(net_deficit_kW(campus_interval_17, 350.0)),
                    by(rule("microgrid-dispatch.pl", clause(15))),
                    bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                    uses([
                      proof(
                        goal(load_kW(campus_interval_17, 620.0)),
                        by(fact("microgrid-dispatch.pl", clause(8)))
                      ),
                      proof(
                        goal(renewable_kW(campus_interval_17, 270.0)),
                        by(rule("microgrid-dispatch.pl", clause(14))),
                        bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                        uses([
                          proof(
                            goal(solar_kW(campus_interval_17, 180.0)),
                            by(fact("microgrid-dispatch.pl", clause(9)))
                          ),
                          proof(
                            goal(wind_kW(campus_interval_17, 90.0)),
                            by(fact("microgrid-dispatch.pl", clause(10)))
                          ),
                          proof(
                            goal(add(180.0, 90.0, 270.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(sub(620.0, 270.0, 350.0)),
                        by(builtin(sub, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(battery_dispatch_kW(campus_interval_17, 240.0)),
                    by(rule("microgrid-dispatch.pl", clause(17))),
                    bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
                    uses([
                      proof(
                        goal(net_deficit_kW(campus_interval_17, 350.0)),
                        by(rule("microgrid-dispatch.pl", clause(15))),
                        bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                        uses([
                          proof(
                            goal(load_kW(campus_interval_17, 620.0)),
                            by(fact("microgrid-dispatch.pl", clause(8)))
                          ),
                          proof(
                            goal(renewable_kW(campus_interval_17, 270.0)),
                            by(rule("microgrid-dispatch.pl", clause(14))),
                            bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                            uses([
                              proof(
                                goal(solar_kW(campus_interval_17, 180.0)),
                                by(fact("microgrid-dispatch.pl", clause(9)))
                              ),
                              proof(
                                goal(wind_kW(campus_interval_17, 90.0)),
                                by(fact("microgrid-dispatch.pl", clause(10)))
                              ),
                              proof(
                                goal(add(180.0, 90.0, 270.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(sub(620.0, 270.0, 350.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                        by(rule("microgrid-dispatch.pl", clause(16))),
                        bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                        uses([
                          proof(
                            goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                            by(fact("microgrid-dispatch.pl", clause(11)))
                          ),
                          proof(
                            goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                            by(fact("microgrid-dispatch.pl", clause(12)))
                          ),
                          proof(
                            goal(sub(320.0, 80.0, 240.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(min(350.0, 240.0, 240.0)),
                        by(builtin(min, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(350.0, 240.0, 110.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(grid_contract_limit_kW(campus_interval_17, 150.0)),
                by(fact("microgrid-dispatch.pl", clause(13)))
              ),
              proof(
                goal(le(110.0, 150.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(reserve_ok(campus_interval_17)),
            by(rule("microgrid-dispatch.pl", clause(21))),
            bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0), binding("Required", 80.0)]),
            uses([
              proof(
                goal(battery_reserve_after_dispatch_kW(campus_interval_17, 80.0)),
                by(rule("microgrid-dispatch.pl", clause(19))),
                bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0), binding("MaxDischarge", 320.0), binding("Dispatch", 240.0)]),
                uses([
                  proof(
                    goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                    by(fact("microgrid-dispatch.pl", clause(11)))
                  ),
                  proof(
                    goal(battery_dispatch_kW(campus_interval_17, 240.0)),
                    by(rule("microgrid-dispatch.pl", clause(17))),
                    bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
                    uses([
                      proof(
                        goal(net_deficit_kW(campus_interval_17, 350.0)),
                        by(rule("microgrid-dispatch.pl", clause(15))),
                        bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                        uses([
                          proof(
                            goal(load_kW(campus_interval_17, 620.0)),
                            by(fact("microgrid-dispatch.pl", clause(8)))
                          ),
                          proof(
                            goal(renewable_kW(campus_interval_17, 270.0)),
                            by(rule("microgrid-dispatch.pl", clause(14))),
                            bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                            uses([
                              proof(
                                goal(solar_kW(campus_interval_17, 180.0)),
                                by(fact("microgrid-dispatch.pl", clause(9)))
                              ),
                              proof(
                                goal(wind_kW(campus_interval_17, 90.0)),
                                by(fact("microgrid-dispatch.pl", clause(10)))
                              ),
                              proof(
                                goal(add(180.0, 90.0, 270.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(sub(620.0, 270.0, 350.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                        by(rule("microgrid-dispatch.pl", clause(16))),
                        bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                        uses([
                          proof(
                            goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                            by(fact("microgrid-dispatch.pl", clause(11)))
                          ),
                          proof(
                            goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                            by(fact("microgrid-dispatch.pl", clause(12)))
                          ),
                          proof(
                            goal(sub(320.0, 80.0, 240.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(min(350.0, 240.0, 240.0)),
                        by(builtin(min, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(320.0, 240.0, 80.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                by(fact("microgrid-dispatch.pl", clause(12)))
              ),
              proof(
                goal(ge(80.0, 80.0)),
                by(builtin(ge, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

reason(campus_interval_17, "battery dispatch covers the deficit while preserving reserve and grid contract limits").
why(
  reason(campus_interval_17, "battery dispatch covers the deficit while preserving reserve and grid contract limits"),
  proof(
    goal(reason(campus_interval_17, "battery dispatch covers the deficit while preserving reserve and grid contract limits")),
    by(rule("microgrid-dispatch.pl", clause(28))),
    bindings([binding("Site", campus_interval_17)]),
    uses([
      proof(
        goal(stable_dispatch(campus_interval_17)),
        by(rule("microgrid-dispatch.pl", clause(22))),
        bindings([binding("Site", campus_interval_17)]),
        uses([
          proof(
            goal(contract_ok(campus_interval_17)),
            by(rule("microgrid-dispatch.pl", clause(20))),
            bindings([binding("Site", campus_interval_17), binding("Import", 110.0), binding("Limit", 150.0)]),
            uses([
              proof(
                goal(grid_import_kW(campus_interval_17, 110.0)),
                by(rule("microgrid-dispatch.pl", clause(18))),
                bindings([binding("Site", campus_interval_17), binding("Import", 110.0), binding("Deficit", 350.0), binding("Dispatch", 240.0)]),
                uses([
                  proof(
                    goal(net_deficit_kW(campus_interval_17, 350.0)),
                    by(rule("microgrid-dispatch.pl", clause(15))),
                    bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                    uses([
                      proof(
                        goal(load_kW(campus_interval_17, 620.0)),
                        by(fact("microgrid-dispatch.pl", clause(8)))
                      ),
                      proof(
                        goal(renewable_kW(campus_interval_17, 270.0)),
                        by(rule("microgrid-dispatch.pl", clause(14))),
                        bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                        uses([
                          proof(
                            goal(solar_kW(campus_interval_17, 180.0)),
                            by(fact("microgrid-dispatch.pl", clause(9)))
                          ),
                          proof(
                            goal(wind_kW(campus_interval_17, 90.0)),
                            by(fact("microgrid-dispatch.pl", clause(10)))
                          ),
                          proof(
                            goal(add(180.0, 90.0, 270.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(sub(620.0, 270.0, 350.0)),
                        by(builtin(sub, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(battery_dispatch_kW(campus_interval_17, 240.0)),
                    by(rule("microgrid-dispatch.pl", clause(17))),
                    bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
                    uses([
                      proof(
                        goal(net_deficit_kW(campus_interval_17, 350.0)),
                        by(rule("microgrid-dispatch.pl", clause(15))),
                        bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                        uses([
                          proof(
                            goal(load_kW(campus_interval_17, 620.0)),
                            by(fact("microgrid-dispatch.pl", clause(8)))
                          ),
                          proof(
                            goal(renewable_kW(campus_interval_17, 270.0)),
                            by(rule("microgrid-dispatch.pl", clause(14))),
                            bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                            uses([
                              proof(
                                goal(solar_kW(campus_interval_17, 180.0)),
                                by(fact("microgrid-dispatch.pl", clause(9)))
                              ),
                              proof(
                                goal(wind_kW(campus_interval_17, 90.0)),
                                by(fact("microgrid-dispatch.pl", clause(10)))
                              ),
                              proof(
                                goal(add(180.0, 90.0, 270.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(sub(620.0, 270.0, 350.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                        by(rule("microgrid-dispatch.pl", clause(16))),
                        bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                        uses([
                          proof(
                            goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                            by(fact("microgrid-dispatch.pl", clause(11)))
                          ),
                          proof(
                            goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                            by(fact("microgrid-dispatch.pl", clause(12)))
                          ),
                          proof(
                            goal(sub(320.0, 80.0, 240.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(min(350.0, 240.0, 240.0)),
                        by(builtin(min, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(350.0, 240.0, 110.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(grid_contract_limit_kW(campus_interval_17, 150.0)),
                by(fact("microgrid-dispatch.pl", clause(13)))
              ),
              proof(
                goal(le(110.0, 150.0)),
                by(builtin(le, 2))
              )
            ])
          ),
          proof(
            goal(reserve_ok(campus_interval_17)),
            by(rule("microgrid-dispatch.pl", clause(21))),
            bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0), binding("Required", 80.0)]),
            uses([
              proof(
                goal(battery_reserve_after_dispatch_kW(campus_interval_17, 80.0)),
                by(rule("microgrid-dispatch.pl", clause(19))),
                bindings([binding("Site", campus_interval_17), binding("ReserveLeft", 80.0), binding("MaxDischarge", 320.0), binding("Dispatch", 240.0)]),
                uses([
                  proof(
                    goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                    by(fact("microgrid-dispatch.pl", clause(11)))
                  ),
                  proof(
                    goal(battery_dispatch_kW(campus_interval_17, 240.0)),
                    by(rule("microgrid-dispatch.pl", clause(17))),
                    bindings([binding("Site", campus_interval_17), binding("Dispatch", 240.0), binding("Deficit", 350.0), binding("Limit", 240.0)]),
                    uses([
                      proof(
                        goal(net_deficit_kW(campus_interval_17, 350.0)),
                        by(rule("microgrid-dispatch.pl", clause(15))),
                        bindings([binding("Site", campus_interval_17), binding("Deficit", 350.0), binding("Load", 620.0), binding("Renewable", 270.0)]),
                        uses([
                          proof(
                            goal(load_kW(campus_interval_17, 620.0)),
                            by(fact("microgrid-dispatch.pl", clause(8)))
                          ),
                          proof(
                            goal(renewable_kW(campus_interval_17, 270.0)),
                            by(rule("microgrid-dispatch.pl", clause(14))),
                            bindings([binding("Site", campus_interval_17), binding("Renewable", 270.0), binding("Solar", 180.0), binding("Wind", 90.0)]),
                            uses([
                              proof(
                                goal(solar_kW(campus_interval_17, 180.0)),
                                by(fact("microgrid-dispatch.pl", clause(9)))
                              ),
                              proof(
                                goal(wind_kW(campus_interval_17, 90.0)),
                                by(fact("microgrid-dispatch.pl", clause(10)))
                              ),
                              proof(
                                goal(add(180.0, 90.0, 270.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(sub(620.0, 270.0, 350.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(reserve_aware_battery_limit_kW(campus_interval_17, 240.0)),
                        by(rule("microgrid-dispatch.pl", clause(16))),
                        bindings([binding("Site", campus_interval_17), binding("Limit", 240.0), binding("MaxDischarge", 320.0), binding("Reserve", 80.0)]),
                        uses([
                          proof(
                            goal(battery_max_discharge_kW(campus_interval_17, 320.0)),
                            by(fact("microgrid-dispatch.pl", clause(11)))
                          ),
                          proof(
                            goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                            by(fact("microgrid-dispatch.pl", clause(12)))
                          ),
                          proof(
                            goal(sub(320.0, 80.0, 240.0)),
                            by(builtin(sub, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(min(350.0, 240.0, 240.0)),
                        by(builtin(min, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(sub(320.0, 240.0, 80.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(required_battery_reserve_kW(campus_interval_17, 80.0)),
                by(fact("microgrid-dispatch.pl", clause(12)))
              ),
              proof(
                goal(ge(80.0, 80.0)),
                by(builtin(ge, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

