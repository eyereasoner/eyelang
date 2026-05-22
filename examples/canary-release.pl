% Technology example: canary release decision.
%
% A canary deployment is rolled back when its measured error rate exceeds the
% allowed budget, even when latency is still acceptable.

canary(canary42, 5000.0, 75.0, 180.0).
threshold(canary42, maximum_error_rate, 0.01).
threshold(canary42, maximum_p95_latency_ms, 200.0).

error_rate(Release, Rate) :-
  canary(Release, Requests, Errors, _P95Latency),
  div(Errors, Requests, Rate).

latency_ok(Release) :-
  canary(Release, _Requests, _Errors, P95Latency),
  threshold(Release, maximum_p95_latency_ms, Maximum),
  lt(P95Latency, Maximum).

error_budget_exceeded(Release) :-
  error_rate(Release, Rate),
  threshold(Release, maximum_error_rate, Maximum),
  gt(Rate, Maximum).

rollback_recommended(Release) :-
  error_budget_exceeded(Release).

triple(Release, errorRate, Rate) :-
  error_rate(Release, Rate).

triple(Release, p95Latency_ms, P95Latency) :-
  canary(Release, _Requests, _Errors, P95Latency).

triple(Release, latencyCheck, ok) :-
  latency_ok(Release).

triple(Release, status, rollback_recommended) :-
  rollback_recommended(Release).

triple(Release, reason, "canary error rate exceeds the allowed budget") :-
  rollback_recommended(Release).
