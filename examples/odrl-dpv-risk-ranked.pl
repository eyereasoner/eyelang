% ODRL + DPV ranked-risk assessment adapted from Eyeling odrl-dpv-risk-ranked.n3.
% Eyeling keeps the ODRL rules inside an N3 quoted policy formula and prints a
% Markdown report.  This Eyelog translation also keeps the
% policy as a formula-valued term, projects local predicates from that formula for
% reasoning, and materializes the derived DPV risks as triple/3 output.

% Consumer profile and needs.
consumer(consumerExample).
title(consumerExample, "Example consumer profile").
has_need(consumerExample, need_DataCannotBeRemoved).
has_need(consumerExample, need_ChangeOnlyWithPriorNotice).
has_need(consumerExample, need_NoSharingWithoutConsent).
has_need(consumerExample, need_DataPortability).

importance(need_DataCannotBeRemoved, 20).
description(need_DataCannotBeRemoved, "Provider must not remove the consumer account/data.").
importance(need_ChangeOnlyWithPriorNotice, 15).
min_notice_days(need_ChangeOnlyWithPriorNotice, 14).
description(need_ChangeOnlyWithPriorNotice, "Agreement may change only with prior notice (>= 14 days).").
importance(need_NoSharingWithoutConsent, 12).
description(need_NoSharingWithoutConsent, "No data sharing without explicit consent.").
importance(need_DataPortability, 10).
description(need_DataPortability, "Consumer must be able to export their data.").

% Agreement and ODRL-style policy structure.
agreement(agreement1).
title(agreement1, "Example Agreement").
process_context(processContext1, agreement1).
title(processContext1, "Service operation under Agreement1").

% The ODRL policy is kept as a graph value.  The clauses below are not asserted
% globally as permission/2, prohibition/2, action/2, ... facts; they are
% triple/3 terms inside policyGraph1.  The local projection predicates below read from the
% formula when evaluating this agreement.  This mirrors N3 quoted formulae and avoids
% making policy triples true outside the formula that contains them.
policy_graph(policyGraph1, (
  triple(policy1, rdf_type, odrl_Policy),
  triple(policy1, odrl_appliesTo, agreement1),
  triple(policy1, odrl_permission, permDeleteAccount),
  triple(policy1, odrl_permission, permChangeTerms),
  triple(policy1, odrl_permission, permShareData),
  triple(policy1, odrl_prohibition, prohibitExportData),

  triple(permDeleteAccount, odrl_assigner, provider),
  triple(permDeleteAccount, odrl_assignee, consumerExample),
  triple(permDeleteAccount, odrl_action, tosl_removeAccount),
  triple(permDeleteAccount, odrl_target, userAccount),
  triple(permDeleteAccount, clause, clauseC1),

  triple(permChangeTerms, odrl_assigner, provider),
  triple(permChangeTerms, odrl_assignee, consumerExample),
  triple(permChangeTerms, odrl_action, tosl_changeTerms),
  triple(permChangeTerms, odrl_target, agreementText),
  triple(permChangeTerms, clause, clauseC2),
  triple(permChangeTerms, odrl_duty, odrl_inform),
  triple(permChangeTerms, noticeDays, 3),

  triple(permShareData, odrl_assigner, provider),
  triple(permShareData, odrl_assignee, consumerExample),
  triple(permShareData, odrl_action, tosl_shareData),
  triple(permShareData, odrl_target, userData),
  triple(permShareData, clause, clauseC3),

  triple(prohibitExportData, odrl_assigner, provider),
  triple(prohibitExportData, odrl_assignee, consumerExample),
  triple(prohibitExportData, odrl_action, tosl_exportData),
  triple(prohibitExportData, odrl_target, userData),
  triple(prohibitExportData, clause, clauseC4)
)).

policy_triple(Subject, Predicate, Object) :-
  policy_graph(_Graph, Formula),
  formula_triple(Formula, Subject, Predicate, Object).

policy(Policy, Agreement) :- policy_triple(Policy, odrl_appliesTo, Agreement).
permission(Policy, Rule) :- policy_triple(Policy, odrl_permission, Rule).
prohibition(Policy, Rule) :- policy_triple(Policy, odrl_prohibition, Rule).
assigner(Rule, Party) :- policy_triple(Rule, odrl_assigner, Party).
assignee(Rule, Party) :- policy_triple(Rule, odrl_assignee, Party).
action(Rule, Action) :- policy_triple(Rule, odrl_action, Action).
target(Rule, Target) :- policy_triple(Rule, odrl_target, Target).
clause(Rule, Clause) :- policy_triple(Rule, clause, Clause).
duty(Rule, Duty) :- policy_triple(Rule, odrl_duty, Duty).
notice_days(Rule, Days) :- policy_triple(Rule, noticeDays, Days).
consent_constraint(Rule, Value) :- policy_triple(Rule, consentConstraint, Value).

clause_id(clauseC1, "C1").
clause_text(clauseC1, "Provider may remove the user account (and associated data) at its discretion.").
clause_id(clauseC2, "C2").
clause_text(clauseC2, "Provider may change terms by informing users at least 3 days in advance.").
clause_id(clauseC3, "C3").
clause_text(clauseC3, "Provider may share user data with partners for business purposes.").
clause_id(clauseC4, "C4").
clause_text(clauseC4, "Users are not permitted to export their data.").

% Missing-safeguard checks corresponding to the log_notIncludes tests in N3.
missing_notice_constraint(Perm) :-
  permission(policy1, Perm),
  not(notice_days(Perm, _Days)).

missing_inform_duty(Perm) :-
  permission(policy1, Perm),
  not(duty(Perm, odrl_inform)).

missing_consent_constraint(Perm) :-
  permission(policy1, Perm),
  action(Perm, tosl_shareData),
  not(consent_constraint(Perm, true)).

% ODRL -> DPV risk derivation.
risk(risk1) :-
  has_need(consumerExample, need_DataCannotBeRemoved),
  permission(policy1, permDeleteAccount),
  action(permDeleteAccount, tosl_removeAccount),
  missing_notice_constraint(permDeleteAccount),
  missing_inform_duty(permDeleteAccount).

risk_source(risk1, src1).
risk_class(risk1, risk_UnwantedDataDeletion).
risk_class(risk1, risk_DataUnavailable).
risk_class(risk1, risk_DataErasureError).
risk_class(risk1, risk_DataLoss).
risk_source_class(src1, risk_LegalComplianceRisk).
risk_source_of(src1, permDeleteAccount).
risk_consequence(risk1, risk_DataLoss).
risk_consequence(risk1, risk_DataUnavailable).
risk_consequence(risk1, risk_CustomerConfidenceLoss).
risk_impact(risk1, risk_FinancialLoss).
risk_impact(risk1, risk_NonMaterialDamage).
about_clause(risk1, clauseC1).
violates_need(risk1, need_DataCannotBeRemoved).
risk_description(risk1, "Risk: account/data removal is permitted without notice safeguards (no notice constraint and no duty to inform). Clause C1: Provider may remove the user account (and associated data) at its discretion.").
base_score(risk1, 90).
mitigation(risk1, m11, "Add a notice constraint (minimum noticeDays) before account removal.").
mitigation(risk1, m21, "Add a duty to inform the consumer prior to account removal.").

risk(risk2) :-
  has_need(consumerExample, need_ChangeOnlyWithPriorNotice),
  min_notice_days(need_ChangeOnlyWithPriorNotice, Required),
  permission(policy1, permChangeTerms),
  action(permChangeTerms, tosl_changeTerms),
  duty(permChangeTerms, odrl_inform),
  notice_days(permChangeTerms, Days),
  lt(Days, Required).

risk_source(risk2, src2).
risk_class(risk2, risk_PolicyRisk).
risk_class(risk2, risk_CustomerConfidenceLoss).
risk_source_class(src2, risk_PolicyRisk).
risk_source_of(src2, permChangeTerms).
risk_consequence(risk2, risk_CustomerConfidenceLoss).
risk_impact(risk2, risk_NonMaterialDamage).
about_clause(risk2, clauseC2).
violates_need(risk2, need_ChangeOnlyWithPriorNotice).
risk_description(risk2, "Risk: terms may change with notice (3 days) below consumer requirement (14 days). Clause C2: Provider may change terms by informing users at least 3 days in advance.").
base_score(risk2, 70).
mitigation(risk2, m12, "Increase minimum noticeDays in the inform duty to meet the consumer requirement.").

risk(risk3) :-
  has_need(consumerExample, need_NoSharingWithoutConsent),
  permission(policy1, permShareData),
  action(permShareData, tosl_shareData),
  missing_consent_constraint(permShareData).

risk_source(risk3, src3).
risk_class(risk3, risk_UnwantedDisclosureData).
risk_class(risk3, risk_CustomerConfidenceLoss).
risk_source_class(src3, risk_PolicyRisk).
risk_source_of(src3, permShareData).
risk_consequence(risk3, risk_CustomerConfidenceLoss).
risk_impact(risk3, risk_NonMaterialDamage).
risk_impact(risk3, risk_FinancialLoss).
about_clause(risk3, clauseC3).
violates_need(risk3, need_NoSharingWithoutConsent).
risk_description(risk3, "Risk: user data sharing is permitted without an explicit consent constraint. Clause C3: Provider may share user data with partners for business purposes.").
base_score(risk3, 85).
mitigation(risk3, m13, "Add an explicit consent constraint before data sharing.").

risk(risk4) :-
  has_need(consumerExample, need_DataPortability),
  prohibition(policy1, prohibitExportData),
  action(prohibitExportData, tosl_exportData).

risk_source(risk4, src4).
risk_class(risk4, risk_PolicyRisk).
risk_class(risk4, risk_CustomerConfidenceLoss).
risk_source_class(src4, risk_PolicyRisk).
risk_source_of(src4, prohibitExportData).
risk_consequence(risk4, risk_CustomerConfidenceLoss).
risk_impact(risk4, risk_NonMaterialDamage).
about_clause(risk4, clauseC4).
violates_need(risk4, need_DataPortability).
risk_description(risk4, "Risk: portability is restricted because exporting user data is prohibited. Clause C4: Users are not permitted to export their data.").
base_score(risk4, 60).
mitigation(risk4, m14, "Add a permission allowing data export (or remove the prohibition) to support portability.").

score_raw(Risk, Raw) :-
  risk(Risk),
  base_score(Risk, Base),
  violates_need(Risk, Need),
  importance(Need, Weight),
  add(Base, Weight, Raw).

score(Risk, 100) :-
  score_raw(Risk, Raw),
  gt(Raw, 100).

score(Risk, Raw) :-
  score_raw(Risk, Raw),
  ge(100, Raw).

severity(Risk, risk_HighSeverity) :-
  score(Risk, Score),
  gt(Score, 79).

risk_level(Risk, risk_HighRisk) :-
  score(Risk, Score),
  gt(Score, 79).

severity(Risk, risk_ModerateSeverity) :-
  score(Risk, Score),
  lt(Score, 80),
  gt(Score, 49).

risk_level(Risk, risk_ModerateRisk) :-
  score(Risk, Score),
  lt(Score, 80),
  gt(Score, 49).

severity(Risk, risk_LowSeverity) :-
  score(Risk, Score),
  lt(Score, 50).

risk_level(Risk, risk_LowRisk) :-
  score(Risk, Score),
  lt(Score, 50).

report_key(Risk, key(InvScore, ClauseId)) :-
  risk(Risk),
  score(Risk, Score),
  sub(1000, Score, InvScore),
  about_clause(Risk, Clause),
  clause_id(Clause, ClauseId).

ranked_before(Left, Right) :-
  report_key(Left, key(LeftInv, _LeftClause)),
  report_key(Right, key(RightInv, _RightClause)),
  lt(LeftInv, RightInv).

ranked_before(Left, Right) :-
  report_key(Left, key(Inv, LeftClause)),
  report_key(Right, key(Inv, RightClause)),
  not_matches(LeftClause, RightClause),
  lt(LeftClause, RightClause).

% Output layer.
triple(agreement1, dct_title, Title) :- title(agreement1, Title).
triple(consumerExample, dct_title, Title) :- title(consumerExample, Title).
triple(processContext1, dct_title, Title) :- title(processContext1, Title).
triple(processContext1, dpv_hasRisk, Risk) :- risk(Risk).
triple(policyGraph1, rdf_type, policyGraph).
triple(agreement1, policyGraph, policyGraph1).
triple(policyGraph1, contains, triple(Subject, Predicate, Object)) :-
  policy_triple(Subject, Predicate, Object).
triple(report, source, agreement1).
triple(report, profile, consumerExample).
triple(report, firstRisk, Risk) :- risk(Risk), not(ranked_before(_Other, Risk)).
triple(riskRanking, before, pair(Left, Right)) :- ranked_before(Left, Right).

triple(Risk, rdf_type, dpv_Risk) :- risk(Risk).
triple(Risk, rdf_type, Class) :- risk(Risk), risk_class(Risk, Class).
triple(Risk, dct_source, Source) :- risk(Risk), risk_source(Risk, Src), risk_source_of(Src, Source).
triple(Risk, risk_hasRiskSource, Src) :- risk(Risk), risk_source(Risk, Src).
triple(Src, rdf_type, risk_RiskSource) :- risk_source(_Risk, Src).
triple(Src, rdf_type, Class) :- risk_source_class(Src, Class).
triple(Src, dct_source, Source) :- risk_source_of(Src, Source).
triple(Risk, dpv_hasConsequence, Consequence) :- risk(Risk), risk_consequence(Risk, Consequence).
triple(Risk, dpv_hasImpact, Impact) :- risk(Risk), risk_impact(Risk, Impact).
triple(Risk, aboutClause, Clause) :- risk(Risk), about_clause(Risk, Clause).
triple(Risk, violatesNeed, Need) :- risk(Risk), violates_need(Risk, Need).
triple(Risk, scoreRaw, Raw) :- score_raw(Risk, Raw).
triple(Risk, score, Score) :- score(Risk, Score).
triple(Risk, dpv_hasSeverity, Severity) :- severity(Risk, Severity).
triple(Risk, dpv_hasRiskLevel, Level) :- risk_level(Risk, Level).
triple(Risk, dct_description, Text) :- risk(Risk), risk_description(Risk, Text).
triple(Risk, reportKey, Key) :- report_key(Risk, Key).
triple(Risk, dpv_isMitigatedByMeasure, Measure) :- mitigation(Risk, Measure, _Text).
triple(Measure, rdf_type, dpv_RiskMitigationMeasure) :- mitigation(_Risk, Measure, _Text).
triple(Measure, dpv_mitigatesRisk, Risk) :- mitigation(Risk, Measure, _Text).
triple(Measure, dct_description, Text) :- mitigation(_Risk, Measure, Text).
triple(Clause, clauseId, Id) :- clause_id(Clause, Id).
triple(Clause, text, Text) :- clause_text(Clause, Text).
