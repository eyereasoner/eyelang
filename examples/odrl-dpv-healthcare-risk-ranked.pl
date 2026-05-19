% ODRL + DPV healthcare risk ranking adapted from Eyeling
% odrl-dpv-healthcare-risk-ranked.n3.
% The agreement policy and mitigation suggestions are formula-valued terms.

party(hospital).
party(researchUnit).
party(pharmaPartner).
party(clinicalAIService).
data_asset(healthRecordData).
data_asset(genomicData).
process(processContextHC1).

title(agreementHC1, "Example Healthcare & Life-Sciences Data Use Agreement").
title(patientExample, "Example patient profile").

has_need(patientExample, need_ConsentForResearch).
has_need(patientExample, need_DeIdentifyBeforeSharing).
has_need(patientExample, need_HumanReviewForAutomatedTriage).
has_need(patientExample, need_RetentionLimit3y).

importance(need_ConsentForResearch, 35).
importance(need_DeIdentifyBeforeSharing, 35).
importance(need_HumanReviewForAutomatedTriage, 25).
importance(need_RetentionLimit3y, 15).
max_retention_days(need_RetentionLimit3y, 1095).

clause_id(clauseH1, "H1").
clause_text(clauseH1, "Hospital may use EHR and genomic data for internal clinical research and publication.").
clause_id(clauseH2, "H2").
clause_text(clauseH2, "Hospital may share genomic data with pharmaceutical partners for drug discovery and R&D.").
clause_id(clauseH3, "H3").
clause_text(clauseH3, "Hospital may use automated triage and prioritisation systems using EHR data.").
clause_id(clauseH4, "H4").
clause_text(clauseH4, "Hospital retains patient health records for 10 years.").

agreement_policy_graph(agreementHC1, policyGraphHC1).

policy_graph(policyGraphHC1, (
  triple(policyHC1, rdf_type, odrl_Policy),
  triple(policyHC1, odrl_permission, permResearchUse),
  triple(policyHC1, odrl_permission, permShareWithPharma),
  triple(policyHC1, odrl_permission, permAutomatedTriage),
  triple(policyHC1, odrl_permission, permRetention10y),

  triple(permResearchUse, rdf_type, odrl_Permission),
  triple(permResearchUse, odrl_assigner, hospital),
  triple(permResearchUse, odrl_assignee, researchUnit),
  triple(permResearchUse, odrl_action, hl7ca_use),
  triple(permResearchUse, odrl_target, healthRecordData),
  triple(permResearchUse, odrl_target, genomicData),
  triple(permResearchUse, odrl_constraint, cResearchPurpose),
  triple(cResearchPurpose, odrl_leftOperand, odrl_purpose),
  triple(cResearchPurpose, odrl_rightOperandReference, purposeHMB),
  triple(permResearchUse, clause, clauseH1),

  triple(permShareWithPharma, rdf_type, odrl_Permission),
  triple(permShareWithPharma, odrl_assigner, hospital),
  triple(permShareWithPharma, odrl_assignee, pharmaPartner),
  triple(permShareWithPharma, odrl_action, hl7ca_disclose),
  triple(permShareWithPharma, odrl_target, genomicData),
  triple(permShareWithPharma, odrl_constraint, cSharePurpose),
  triple(cSharePurpose, odrl_leftOperand, odrl_purpose),
  triple(cSharePurpose, odrl_rightOperandReference, purposeHMB),
  triple(permShareWithPharma, clause, clauseH2),

  triple(permAutomatedTriage, rdf_type, odrl_Permission),
  triple(permAutomatedTriage, odrl_assigner, hospital),
  triple(permAutomatedTriage, odrl_assignee, clinicalAIService),
  triple(permAutomatedTriage, odrl_action, hl7ca_use),
  triple(permAutomatedTriage, odrl_target, healthRecordData),
  triple(permAutomatedTriage, odrl_constraint, cTriagePurpose),
  triple(cTriagePurpose, odrl_leftOperand, odrl_purpose),
  triple(cTriagePurpose, odrl_rightOperandReference, purposeCC),
  triple(permAutomatedTriage, odrl_duty, dutyHumanReview),
  triple(dutyHumanReview, odrl_action, humanReview),
  triple(dutyHumanReview, odrl_constraint, cTriageEncryption),
  triple(cTriageEncryption, odrl_leftOperand, encryptionAtRest),
  triple(cTriageEncryption, odrl_rightOperand, true),
  triple(permAutomatedTriage, clause, clauseH3),

  triple(permRetention10y, rdf_type, odrl_Permission),
  triple(permRetention10y, odrl_assigner, hospital),
  triple(permRetention10y, odrl_assignee, hospital),
  triple(permRetention10y, odrl_action, hl7ca_collect),
  triple(permRetention10y, odrl_target, healthRecordData),
  triple(permRetention10y, odrl_constraint, cRetentionPurpose),
  triple(cRetentionPurpose, odrl_leftOperand, odrl_purpose),
  triple(cRetentionPurpose, odrl_rightOperandReference, purposeCC),
  triple(permRetention10y, odrl_constraint, cRetentionDays),
  triple(cRetentionDays, odrl_leftOperand, retentionDays),
  triple(cRetentionDays, odrl_rightOperand, 3650),
  triple(permRetention10y, clause, clauseH4)
)).

policy_triple(GraphName, Subject, Predicate, Object) :-
  policy_graph(GraphName, Formula),
  formula_triple(Formula, Subject, Predicate, Object).

permission(Graph, Permission) :- policy_triple(Graph, policyHC1, odrl_permission, Permission).
clause(Graph, Permission, Clause) :- policy_triple(Graph, Permission, clause, Clause).
action(Graph, Permission, Action) :- policy_triple(Graph, Permission, odrl_action, Action).
target(Graph, Permission, Target) :- policy_triple(Graph, Permission, odrl_target, Target).
duty(Graph, Permission, Duty) :- policy_triple(Graph, Permission, odrl_duty, Duty).
duty_action(Graph, Duty, Action) :- policy_triple(Graph, Duty, odrl_action, Action).
constraint(Graph, Permission, Constraint) :- policy_triple(Graph, Permission, odrl_constraint, Constraint).
constraint_left(Graph, Constraint, Left) :- policy_triple(Graph, Constraint, odrl_leftOperand, Left).
constraint_right(Graph, Constraint, Right) :- policy_triple(Graph, Constraint, odrl_rightOperand, Right).

has_constraint(Graph, Permission, Left, Right) :-
  constraint(Graph, Permission, Constraint),
  constraint_left(Graph, Constraint, Left),
  constraint_right(Graph, Constraint, Right).

has_duty_action(Graph, Permission, Action) :-
  duty(Graph, Permission, Duty),
  duty_action(Graph, Duty, Action).

missing_explicit_consent(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_constraint(Graph, Permission, explicitConsent, true)).

missing_deidentified(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_constraint(Graph, Permission, deIdentified, true)).

missing_human_review(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_duty_action(Graph, Permission, humanReview)).

retention_days(Graph, Permission, Days) :-
  has_constraint(Graph, Permission, retentionDays, Days).

risk(riskH1) :-
  agreement_policy_graph(agreementHC1, Graph),
  has_need(patientExample, need_ConsentForResearch),
  permission(Graph, permResearchUse),
  clause(Graph, permResearchUse, clauseH1),
  missing_explicit_consent(Graph, permResearchUse).

risk(riskH2) :-
  agreement_policy_graph(agreementHC1, Graph),
  has_need(patientExample, need_DeIdentifyBeforeSharing),
  permission(Graph, permShareWithPharma),
  target(Graph, permShareWithPharma, genomicData),
  clause(Graph, permShareWithPharma, clauseH2),
  missing_deidentified(Graph, permShareWithPharma).

risk(riskH3) :-
  agreement_policy_graph(agreementHC1, Graph),
  has_need(patientExample, need_HumanReviewForAutomatedTriage),
  permission(Graph, permAutomatedTriage),
  clause(Graph, permAutomatedTriage, clauseH3),
  missing_human_review(Graph, permAutomatedTriage).

risk(riskH4) :-
  agreement_policy_graph(agreementHC1, Graph),
  has_need(patientExample, need_RetentionLimit3y),
  max_retention_days(need_RetentionLimit3y, Max),
  permission(Graph, permRetention10y),
  clause(Graph, permRetention10y, clauseH4),
  retention_days(Graph, permRetention10y, Days),
  gt(Days, Max).

base_score(riskH1, 85).
base_score(riskH2, 90).
base_score(riskH3, 80).
base_score(riskH4, 55).
violates_need(riskH1, need_ConsentForResearch).
violates_need(riskH2, need_DeIdentifyBeforeSharing).
violates_need(riskH3, need_HumanReviewForAutomatedTriage).
violates_need(riskH4, need_RetentionLimit3y).
about_clause(riskH1, clauseH1).
about_clause(riskH2, clauseH2).
about_clause(riskH3, clauseH3).
about_clause(riskH4, clauseH4).
risk_source_of(riskH1, permResearchUse).
risk_source_of(riskH2, permShareWithPharma).
risk_source_of(riskH3, permAutomatedTriage).
risk_source_of(riskH4, permRetention10y).

description(riskH1, "Risk: health/genomic data may be used for research without explicit opt-in consent.").
description(riskH2, "Risk: genomic data may be shared with external pharma partners without a de-identification/pseudonymisation requirement.").
description(riskH3, "Risk: automated triage may affect care pathways without a human review/override safeguard.").
description(riskH4, "Risk: retention (3650 days) exceeds patient preference (1095 days).").

mitigation_graph(riskH1, mitigateConsent, (
  triple(permResearchUse, odrl_constraint, cExplicitConsent),
  triple(cExplicitConsent, odrl_leftOperand, explicitConsent),
  triple(cExplicitConsent, odrl_rightOperand, true)
)).
mitigation_graph(riskH2, mitigateDeId, (
  triple(permShareWithPharma, odrl_constraint, cDeIdentified),
  triple(cDeIdentified, odrl_leftOperand, deIdentified),
  triple(cDeIdentified, odrl_rightOperand, true),
  triple(permShareWithPharma, odrl_duty, dutyDeIdentify),
  triple(dutyDeIdentify, odrl_action, deIdentify)
)).
mitigation_graph(riskH3, mitigateHumanReview, (
  triple(permAutomatedTriage, odrl_duty, dutyHumanReview),
  triple(dutyHumanReview, odrl_action, humanReview)
)).
mitigation_graph(riskH4, mitigateRetention, (
  triple(permRetention10y, odrl_constraint, cRetentionLimit),
  triple(cRetentionLimit, odrl_leftOperand, retentionDays),
  triple(cRetentionLimit, odrl_rightOperand, 1095)
)).

score_raw(Risk, Raw) :-
  risk(Risk),
  base_score(Risk, Base),
  violates_need(Risk, Need),
  importance(Need, Weight),
  add(Base, Weight, Raw).

score(Risk, 100) :- score_raw(Risk, Raw), gt(Raw, 100).
score(Risk, Raw) :- score_raw(Risk, Raw), ge(100, Raw).

severity(Risk, risk_HighSeverity) :- score(Risk, Score), gt(Score, 79).
severity(Risk, risk_ModerateSeverity) :- score(Risk, Score), lt(Score, 80), gt(Score, 49).
risk_level(Risk, risk_HighRisk) :- score(Risk, Score), gt(Score, 79).
risk_level(Risk, risk_ModerateRisk) :- score(Risk, Score), lt(Score, 80), gt(Score, 49).

report_key(Risk, Key) :- score(Risk, Score), sub(1000, Score, Key).

triple(agreementHC1, policyGraph, GraphTerm) :-
  agreement_policy_graph(agreementHC1, Graph),
  policy_graph(Graph, GraphTerm).

triple(policyGraphHC1, contains, triple(Subject, Predicate, Object)) :-
  policy_triple(policyGraphHC1, Subject, Predicate, Object).

triple(processContextHC1, dpv_hasRisk, Risk) :- risk(Risk).
triple(Risk, rdf_type, dpv_Risk) :- risk(Risk).
triple(Risk, scoreRaw, Raw) :- score_raw(Risk, Raw).
triple(Risk, score, Score) :- score(Risk, Score).
triple(Risk, dpv_hasRiskLevel, Level) :- risk_level(Risk, Level).
triple(Risk, dpv_hasSeverity, Severity) :- severity(Risk, Severity).
triple(Risk, aboutClause, Clause) :- risk(Risk), about_clause(Risk, Clause).
triple(Risk, violatesNeed, Need) :- risk(Risk), violates_need(Risk, Need).
triple(Risk, dct_source, Source) :- risk(Risk), risk_source_of(Risk, Source).
triple(Risk, dct_description, Description) :- risk(Risk), description(Risk, Description).
triple(Risk, reportKey, Key) :- report_key(Risk, Key).
triple(Risk, dpv_isMitigatedByMeasure, Mitigation) :- risk(Risk), mitigation_graph(Risk, Mitigation, _Graph).
triple(Mitigation, suggestAddGraph, Graph) :- mitigation_graph(Risk, Mitigation, Graph), risk(Risk).
triple(report, firstRisk, riskH1) :- score(riskH1, 100), score(riskH2, 100).
triple(report, retentionRiskScore, Score) :- score(riskH4, Score).
