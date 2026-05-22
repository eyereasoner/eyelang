% EYE-inspired epidemic policy choice.
% Policies are evaluated by estimated reproduction risk and social cost.

policy(no_mandate).
policy(vaccination_campaign).
policy(indoor_masks).
policy(vaccination_and_masks).

base_risk(1.40).

vaccination_factor(no_mandate, 1.00).
vaccination_factor(vaccination_campaign, 0.55).
vaccination_factor(indoor_masks, 1.00).
vaccination_factor(vaccination_and_masks, 0.55).

mask_factor(no_mandate, 1.00).
mask_factor(vaccination_campaign, 1.00).
mask_factor(indoor_masks, 0.65).
mask_factor(vaccination_and_masks, 0.65).

policy_cost(no_mandate, 0).
policy_cost(vaccination_campaign, 3).
policy_cost(indoor_masks, 2).
policy_cost(vaccination_and_masks, 5).

risk_score(P, R) :-
  base_risk(Base),
  vaccination_factor(P, VF),
  mask_factor(P, MF),
  mul(Base, VF, A),
  mul(A, MF, R).

acceptable(P) :-
  risk_score(P, R),
  le(R, 0.75).

status(P, insufficient_control) :-
  policy(P),
  risk_score(P, R),
  gt(R, 0.75).

status(P, acceptable_control) :-
  acceptable(P).

recommended(vaccination_and_masks) :-
  acceptable(vaccination_and_masks),
  status(no_mandate, insufficient_control),
  status(vaccination_campaign, insufficient_control),
  status(indoor_masks, insufficient_control).

triple(P, riskScore, R) :- risk_score(P, R).
triple(P, cost, C) :- policy_cost(P, C).
triple(P, status, S) :- status(P, S).
triple(epidemic_policy, recommendedPolicy, P) :- recommended(P).
triple(epidemic_policy, reason, "combined vaccination and indoor masks are the only policy below the outbreak threshold") :-
  recommended(vaccination_and_masks).
