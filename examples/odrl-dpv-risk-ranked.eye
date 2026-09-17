# Source: eyeleng/examples/odrl-dpv-risk-ranked.srl (b7c7e46f8297).
need(data_cannot_be_removed, 20). need(prior_notice, 15). need(no_sharing, 12). need(portability, 10).
conflict(c1, data_cannot_be_removed). conflict(c2, prior_notice). conflict(c3, no_sharing). conflict(c4, portability).
risk(?clause, ?score) if conflict(?clause, ?need), need(?need, ?score).
rank(?clause, high) if risk(?clause, ?score), ?score >= 15.
rank(?clause, medium) if risk(?clause, ?score), ?score >= 10, ?score < 15.
ask risk(?clause, ?score), rank(?clause, ?rank).
