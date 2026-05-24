errorRate(canary42, 0.014999999999999999).
latencyCheck(canary42, ok).
p95Latency_ms(canary42, 180.0).
reason(canary42, "canary error rate exceeds the allowed budget").
status(canary42, rollback_recommended).
