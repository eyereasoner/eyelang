% Technology example: network path SLA check.
%
% The path latency is the sum of link delays plus jitter. The path is compliant
% when the resulting end-to-end latency stays below the SLA limit.

path(edge_path, [link_a, link_b, link_c]).
link_latency(link_a, 12.0).
link_latency(link_b, 18.0).
link_latency(link_c, 9.0).
jitter(edge_path, 8.0).
sla(edge_path, maximum_latency_ms, 50.0).

latency_sum([], 0.0).
latency_sum([Link|Links], Total) :-
  link_latency(Link, LinkLatency),
  latency_sum(Links, Rest),
  add(LinkLatency, Rest, Total).

end_to_end_latency(Path, Latency) :-
  path(Path, Links),
  latency_sum(Links, LinkLatency),
  jitter(Path, Jitter),
  add(LinkLatency, Jitter, Latency).

sla_compliant(Path) :-
  end_to_end_latency(Path, Latency),
  sla(Path, maximum_latency_ms, Maximum),
  lt(Latency, Maximum).

triple(Path, endToEndLatency_ms, Latency) :-
  end_to_end_latency(Path, Latency).

triple(Path, slaLimit_ms, Maximum) :-
  sla(Path, maximum_latency_ms, Maximum).

triple(Path, status, sla_compliant) :-
  sla_compliant(Path).

triple(Path, reason, "path latency including jitter is below the SLA limit") :-
  sla_compliant(Path).
