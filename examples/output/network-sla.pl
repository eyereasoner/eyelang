endToEndLatency_ms(edge_path, 47.0).
why(
  endToEndLatency_ms(edge_path, 47.0),
  proof(
    goal(endToEndLatency_ms(edge_path, 47.0)), by(rule("network-sla.pl", clause(15))),
    bindings([binding("Path", edge_path), binding("Latency", 47.0)]),
    uses([
      proof(
        goal(end_to_end_latency(edge_path, 47.0)), by(rule("network-sla.pl", clause(13))),
        bindings([binding("Path", edge_path), binding("Latency", 47.0), binding("Links", [link_a, link_b, link_c]), binding("LinkLatency", 39.0), binding("Jitter", 8.0)]),
        uses([
          proof(goal(path(edge_path, [link_a, link_b, link_c])), by(fact("network-sla.pl", clause(5)))),
          proof(
            goal(latency_sum([link_a, link_b, link_c], 39.0)), by(rule("network-sla.pl", clause(12))),
            bindings([binding("Link", link_a), binding("Links", [link_b, link_c]), binding("Total", 39.0), binding("LinkLatency", 12.0), binding("Rest", 27.0)]),
            uses([
              proof(goal(link_latency(link_a, 12.0)), by(fact("network-sla.pl", clause(6)))),
              proof(
                goal(latency_sum([link_b, link_c], 27.0)), by(rule("network-sla.pl", clause(12))),
                bindings([binding("Link", link_b), binding("Links", [link_c]), binding("Total", 27.0), binding("LinkLatency", 18.0), binding("Rest", 9.0)]),
                uses([
                  proof(goal(link_latency(link_b, 18.0)), by(fact("network-sla.pl", clause(7)))),
                  proof(
                    goal(latency_sum([link_c], 9.0)), by(rule("network-sla.pl", clause(12))),
                    bindings([binding("Link", link_c), binding("Links", []), binding("Total", 9.0), binding("LinkLatency", 9.0), binding("Rest", 0.0)]),
                    uses([
                      proof(goal(link_latency(link_c, 9.0)), by(fact("network-sla.pl", clause(8)))),
                      proof(goal(latency_sum([], 0.0)), by(fact("network-sla.pl", clause(11)))),
                      proof(goal(add(9.0, 0.0, 9.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(18.0, 9.0, 27.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(12.0, 27.0, 39.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(jitter(edge_path, 8.0)), by(fact("network-sla.pl", clause(9)))),
          proof(goal(add(39.0, 8.0, 47.0)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

slaLimit_ms(edge_path, 50.0).
why(
  slaLimit_ms(edge_path, 50.0),
  proof(
    goal(slaLimit_ms(edge_path, 50.0)), by(rule("network-sla.pl", clause(16))),
    bindings([binding("Path", edge_path), binding("Maximum", 50.0)]),
    uses([
      proof(goal(sla(edge_path, maximum_latency_ms, 50.0)), by(fact("network-sla.pl", clause(10))))
    ])
  )
).

status(edge_path, sla_compliant).
why(
  status(edge_path, sla_compliant),
  proof(
    goal(status(edge_path, sla_compliant)), by(rule("network-sla.pl", clause(17))),
    bindings([binding("Path", edge_path)]),
    uses([
      proof(
        goal(sla_compliant(edge_path)), by(rule("network-sla.pl", clause(14))),
        bindings([binding("Path", edge_path), binding("Latency", 47.0), binding("Maximum", 50.0)]),
        uses([
          proof(
            goal(end_to_end_latency(edge_path, 47.0)), by(rule("network-sla.pl", clause(13))),
            bindings([binding("Path", edge_path), binding("Latency", 47.0), binding("Links", [link_a, link_b, link_c]), binding("LinkLatency", 39.0), binding("Jitter", 8.0)]),
            uses([
              proof(goal(path(edge_path, [link_a, link_b, link_c])), by(fact("network-sla.pl", clause(5)))),
              proof(
                goal(latency_sum([link_a, link_b, link_c], 39.0)), by(rule("network-sla.pl", clause(12))),
                bindings([binding("Link", link_a), binding("Links", [link_b, link_c]), binding("Total", 39.0), binding("LinkLatency", 12.0), binding("Rest", 27.0)]),
                uses([
                  proof(goal(link_latency(link_a, 12.0)), by(fact("network-sla.pl", clause(6)))),
                  proof(
                    goal(latency_sum([link_b, link_c], 27.0)), by(rule("network-sla.pl", clause(12))),
                    bindings([binding("Link", link_b), binding("Links", [link_c]), binding("Total", 27.0), binding("LinkLatency", 18.0), binding("Rest", 9.0)]),
                    uses([
                      proof(goal(link_latency(link_b, 18.0)), by(fact("network-sla.pl", clause(7)))),
                      proof(
                        goal(latency_sum([link_c], 9.0)), by(rule("network-sla.pl", clause(12))),
                        bindings([binding("Link", link_c), binding("Links", []), binding("Total", 9.0), binding("LinkLatency", 9.0), binding("Rest", 0.0)]),
                        uses([
                          proof(goal(link_latency(link_c, 9.0)), by(fact("network-sla.pl", clause(8)))),
                          proof(goal(latency_sum([], 0.0)), by(fact("network-sla.pl", clause(11)))),
                          proof(goal(add(9.0, 0.0, 9.0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(18.0, 9.0, 27.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(12.0, 27.0, 39.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(jitter(edge_path, 8.0)), by(fact("network-sla.pl", clause(9)))),
              proof(goal(add(39.0, 8.0, 47.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sla(edge_path, maximum_latency_ms, 50.0)), by(fact("network-sla.pl", clause(10)))),
          proof(goal(lt(47.0, 50.0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

reason(edge_path, "path latency including jitter is below the SLA limit").
why(
  reason(edge_path, "path latency including jitter is below the SLA limit"),
  proof(
    goal(reason(edge_path, "path latency including jitter is below the SLA limit")), by(rule("network-sla.pl", clause(18))),
    bindings([binding("Path", edge_path)]),
    uses([
      proof(
        goal(sla_compliant(edge_path)), by(rule("network-sla.pl", clause(14))),
        bindings([binding("Path", edge_path), binding("Latency", 47.0), binding("Maximum", 50.0)]),
        uses([
          proof(
            goal(end_to_end_latency(edge_path, 47.0)), by(rule("network-sla.pl", clause(13))),
            bindings([binding("Path", edge_path), binding("Latency", 47.0), binding("Links", [link_a, link_b, link_c]), binding("LinkLatency", 39.0), binding("Jitter", 8.0)]),
            uses([
              proof(goal(path(edge_path, [link_a, link_b, link_c])), by(fact("network-sla.pl", clause(5)))),
              proof(
                goal(latency_sum([link_a, link_b, link_c], 39.0)), by(rule("network-sla.pl", clause(12))),
                bindings([binding("Link", link_a), binding("Links", [link_b, link_c]), binding("Total", 39.0), binding("LinkLatency", 12.0), binding("Rest", 27.0)]),
                uses([
                  proof(goal(link_latency(link_a, 12.0)), by(fact("network-sla.pl", clause(6)))),
                  proof(
                    goal(latency_sum([link_b, link_c], 27.0)), by(rule("network-sla.pl", clause(12))),
                    bindings([binding("Link", link_b), binding("Links", [link_c]), binding("Total", 27.0), binding("LinkLatency", 18.0), binding("Rest", 9.0)]),
                    uses([
                      proof(goal(link_latency(link_b, 18.0)), by(fact("network-sla.pl", clause(7)))),
                      proof(
                        goal(latency_sum([link_c], 9.0)), by(rule("network-sla.pl", clause(12))),
                        bindings([binding("Link", link_c), binding("Links", []), binding("Total", 9.0), binding("LinkLatency", 9.0), binding("Rest", 0.0)]),
                        uses([
                          proof(goal(link_latency(link_c, 9.0)), by(fact("network-sla.pl", clause(8)))),
                          proof(goal(latency_sum([], 0.0)), by(fact("network-sla.pl", clause(11)))),
                          proof(goal(add(9.0, 0.0, 9.0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(18.0, 9.0, 27.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(12.0, 27.0, 39.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(jitter(edge_path, 8.0)), by(fact("network-sla.pl", clause(9)))),
              proof(goal(add(39.0, 8.0, 47.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(sla(edge_path, maximum_latency_ms, 50.0)), by(fact("network-sla.pl", clause(10)))),
          proof(goal(lt(47.0, 50.0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

