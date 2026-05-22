% Access control policy example adapted from Eyelet input/access-control-policy.pl.
%
% This version avoids findall/3 by expressing allOf/anyOf/noneOf checks as
% finite logical conditions.  The universal allOf/noneOf checks use negation
% as failure over bound policy facts.

policy_request(test1, policy_x).
has(test1, claim_a).
has(test1, claim_b).
has(test1, claim_c).

policy(policy_x).
allOf(policy_x, claim_a).
allOf(policy_x, claim_b).
anyOf(policy_x, claim_c).
noneOf(policy_x, claim_d).

passes_all_of(Request, Policy) :-
  policy_request(Request, Policy),
  policy(Policy),
  not((allOf(Policy, Claim), not(has(Request, Claim)))).

passes_any_of(Request, Policy) :-
  policy_request(Request, Policy),
  policy(Policy),
  anyOf(Policy, Claim),
  has(Request, Claim).

passes_none_of(Request, Policy) :-
  policy_request(Request, Policy),
  policy(Policy),
  not((noneOf(Policy, Claim), has(Request, Claim))).

passes_policy(Request, Policy) :-
  passes_all_of(Request, Policy),
  passes_any_of(Request, Policy),
  passes_none_of(Request, Policy).

triple(test1, policy, policy_x).

triple(test1, status, policy_passed) :-
  passes_policy(test1, policy_x).

triple(test1, reason, "all required claims are present, one allowed claim is present, and no forbidden claim is present") :-
  passes_policy(test1, policy_x).
