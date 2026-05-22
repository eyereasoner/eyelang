% Technology example: cache performance summary.
%
% A service has cache hits and misses with different response latencies. The
% rules compute hit rate and weighted average latency, then classify whether
% the cache is effective.

cache_sample(api_cache, 8600.0, 1400.0, 5.0, 80.0).
threshold(api_cache, minimum_hit_rate, 0.80).
threshold(api_cache, maximum_average_latency_ms, 20.0).

total_requests(Cache, Total) :-
  cache_sample(Cache, Hits, Misses, _HitLatency, _MissLatency),
  add(Hits, Misses, Total).

hit_rate(Cache, Rate) :-
  cache_sample(Cache, Hits, _Misses, _HitLatency, _MissLatency),
  total_requests(Cache, Total),
  div(Hits, Total, Rate).

average_latency(Cache, Average) :-
  cache_sample(Cache, Hits, Misses, HitLatency, MissLatency),
  mul(Hits, HitLatency, HitCost),
  mul(Misses, MissLatency, MissCost),
  add(HitCost, MissCost, TotalCost),
  total_requests(Cache, Total),
  div(TotalCost, Total, Average).

cache_effective(Cache) :-
  hit_rate(Cache, Rate),
  threshold(Cache, minimum_hit_rate, MinimumRate),
  gt(Rate, MinimumRate),
  average_latency(Cache, Average),
  threshold(Cache, maximum_average_latency_ms, MaximumLatency),
  lt(Average, MaximumLatency).

triple(Cache, hitRate, Rate) :-
  hit_rate(Cache, Rate).

triple(Cache, averageLatency_ms, Average) :-
  average_latency(Cache, Average).

triple(Cache, status, cache_effective) :-
  cache_effective(Cache).

triple(Cache, reason, "hit rate is above target and average latency is below limit") :-
  cache_effective(Cache).
