% ODRL + DPV healthcare risk ranking adapted from Eyeling
% odrl-dpv-healthcare-risk-ranked.n3.
% The agreement policy and mitigation suggestions are graph-valued terms.

party(:Hospital).
party(:ResearchUnit).
party(:PharmaPartner).
party(:ClinicalAIService).
data_asset(:HealthRecordData).
data_asset(:GenomicData).
process(:ProcessContextHC1).

title(:AgreementHC1, "Example Healthcare & Life-Sciences Data Use Agreement").
title(:PatientExample, "Example patient profile").

has_need(:PatientExample, :Need_ConsentForResearch).
has_need(:PatientExample, :Need_DeIdentifyBeforeSharing).
has_need(:PatientExample, :Need_HumanReviewForAutomatedTriage).
has_need(:PatientExample, :Need_RetentionLimit3y).

importance(:Need_ConsentForResearch, 35).
importance(:Need_DeIdentifyBeforeSharing, 35).
importance(:Need_HumanReviewForAutomatedTriage, 25).
importance(:Need_RetentionLimit3y, 15).
max_retention_days(:Need_RetentionLimit3y, 1095).

clause_id(:ClauseH1, "H1").
clause_text(:ClauseH1, "Hospital may use EHR and genomic data for internal clinical research and publication.").
clause_id(:ClauseH2, "H2").
clause_text(:ClauseH2, "Hospital may share genomic data with pharmaceutical partners for drug discovery and R&D.").
clause_id(:ClauseH3, "H3").
clause_text(:ClauseH3, "Hospital may use automated triage and prioritisation systems using EHR data.").
clause_id(:ClauseH4, "H4").
clause_text(:ClauseH4, "Hospital retains patient health records for 10 years.").

agreement_policy_graph(:AgreementHC1, :PolicyGraphHC1).

policy_graph(:PolicyGraphHC1, graph([
  triple(:PolicyHC1, rdf:type, odrl:Policy),
  triple(:PolicyHC1, odrl:permission, :PermResearchUse),
  triple(:PolicyHC1, odrl:permission, :PermShareWithPharma),
  triple(:PolicyHC1, odrl:permission, :PermAutomatedTriage),
  triple(:PolicyHC1, odrl:permission, :PermRetention10y),

  triple(:PermResearchUse, rdf:type, odrl:Permission),
  triple(:PermResearchUse, odrl:assigner, :Hospital),
  triple(:PermResearchUse, odrl:assignee, :ResearchUnit),
  triple(:PermResearchUse, odrl:action, hl7ca:use),
  triple(:PermResearchUse, odrl:target, :HealthRecordData),
  triple(:PermResearchUse, odrl:target, :GenomicData),
  triple(:PermResearchUse, odrl:constraint, :CResearchPurpose),
  triple(:CResearchPurpose, odrl:leftOperand, odrl:purpose),
  triple(:CResearchPurpose, odrl:rightOperandReference, :PurposeHMB),
  triple(:PermResearchUse, :clause, :ClauseH1),

  triple(:PermShareWithPharma, rdf:type, odrl:Permission),
  triple(:PermShareWithPharma, odrl:assigner, :Hospital),
  triple(:PermShareWithPharma, odrl:assignee, :PharmaPartner),
  triple(:PermShareWithPharma, odrl:action, hl7ca:disclose),
  triple(:PermShareWithPharma, odrl:target, :GenomicData),
  triple(:PermShareWithPharma, odrl:constraint, :CSharePurpose),
  triple(:CSharePurpose, odrl:leftOperand, odrl:purpose),
  triple(:CSharePurpose, odrl:rightOperandReference, :PurposeHMB),
  triple(:PermShareWithPharma, :clause, :ClauseH2),

  triple(:PermAutomatedTriage, rdf:type, odrl:Permission),
  triple(:PermAutomatedTriage, odrl:assigner, :Hospital),
  triple(:PermAutomatedTriage, odrl:assignee, :ClinicalAIService),
  triple(:PermAutomatedTriage, odrl:action, hl7ca:use),
  triple(:PermAutomatedTriage, odrl:target, :HealthRecordData),
  triple(:PermAutomatedTriage, odrl:constraint, :CTriagePurpose),
  triple(:CTriagePurpose, odrl:leftOperand, odrl:purpose),
  triple(:CTriagePurpose, odrl:rightOperandReference, :PurposeCC),
  triple(:PermAutomatedTriage, odrl:duty, :DutyHumanReview),
  triple(:DutyHumanReview, odrl:action, :humanReview),
  triple(:DutyHumanReview, odrl:constraint, :CTriageEncryption),
  triple(:CTriageEncryption, odrl:leftOperand, :encryptionAtRest),
  triple(:CTriageEncryption, odrl:rightOperand, true),
  triple(:PermAutomatedTriage, :clause, :ClauseH3),

  triple(:PermRetention10y, rdf:type, odrl:Permission),
  triple(:PermRetention10y, odrl:assigner, :Hospital),
  triple(:PermRetention10y, odrl:assignee, :Hospital),
  triple(:PermRetention10y, odrl:action, hl7ca:collect),
  triple(:PermRetention10y, odrl:target, :HealthRecordData),
  triple(:PermRetention10y, odrl:constraint, :CRetentionPurpose),
  triple(:CRetentionPurpose, odrl:leftOperand, odrl:purpose),
  triple(:CRetentionPurpose, odrl:rightOperandReference, :PurposeCC),
  triple(:PermRetention10y, odrl:constraint, :CRetentionDays),
  triple(:CRetentionDays, odrl:leftOperand, :retentionDays),
  triple(:CRetentionDays, odrl:rightOperand, 3650),
  triple(:PermRetention10y, :clause, :ClauseH4)
])).

graph_triple(graph(Statements), Subject, Predicate, Object) :-
  member(triple(Subject, Predicate, Object), Statements).

policy_triple(GraphName, Subject, Predicate, Object) :-
  policy_graph(GraphName, Graph),
  graph_triple(Graph, Subject, Predicate, Object).

permission(Graph, Permission) :- policy_triple(Graph, :PolicyHC1, odrl:permission, Permission).
clause(Graph, Permission, Clause) :- policy_triple(Graph, Permission, :clause, Clause).
action(Graph, Permission, Action) :- policy_triple(Graph, Permission, odrl:action, Action).
target(Graph, Permission, Target) :- policy_triple(Graph, Permission, odrl:target, Target).
duty(Graph, Permission, Duty) :- policy_triple(Graph, Permission, odrl:duty, Duty).
duty_action(Graph, Duty, Action) :- policy_triple(Graph, Duty, odrl:action, Action).
constraint(Graph, Permission, Constraint) :- policy_triple(Graph, Permission, odrl:constraint, Constraint).
constraint_left(Graph, Constraint, Left) :- policy_triple(Graph, Constraint, odrl:leftOperand, Left).
constraint_right(Graph, Constraint, Right) :- policy_triple(Graph, Constraint, odrl:rightOperand, Right).

has_constraint(Graph, Permission, Left, Right) :-
  constraint(Graph, Permission, Constraint),
  constraint_left(Graph, Constraint, Left),
  constraint_right(Graph, Constraint, Right).

has_duty_action(Graph, Permission, Action) :-
  duty(Graph, Permission, Duty),
  duty_action(Graph, Duty, Action).

missing_explicit_consent(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_constraint(Graph, Permission, :explicitConsent, true)).

missing_deidentified(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_constraint(Graph, Permission, :deIdentified, true)).

missing_human_review(Graph, Permission) :-
  permission(Graph, Permission),
  not(has_duty_action(Graph, Permission, :humanReview)).

retention_days(Graph, Permission, Days) :-
  has_constraint(Graph, Permission, :retentionDays, Days).

risk(:riskH1) :-
  agreement_policy_graph(:AgreementHC1, Graph),
  has_need(:PatientExample, :Need_ConsentForResearch),
  permission(Graph, :PermResearchUse),
  clause(Graph, :PermResearchUse, :ClauseH1),
  missing_explicit_consent(Graph, :PermResearchUse).

risk(:riskH2) :-
  agreement_policy_graph(:AgreementHC1, Graph),
  has_need(:PatientExample, :Need_DeIdentifyBeforeSharing),
  permission(Graph, :PermShareWithPharma),
  target(Graph, :PermShareWithPharma, :GenomicData),
  clause(Graph, :PermShareWithPharma, :ClauseH2),
  missing_deidentified(Graph, :PermShareWithPharma).

risk(:riskH3) :-
  agreement_policy_graph(:AgreementHC1, Graph),
  has_need(:PatientExample, :Need_HumanReviewForAutomatedTriage),
  permission(Graph, :PermAutomatedTriage),
  clause(Graph, :PermAutomatedTriage, :ClauseH3),
  missing_human_review(Graph, :PermAutomatedTriage).

risk(:riskH4) :-
  agreement_policy_graph(:AgreementHC1, Graph),
  has_need(:PatientExample, :Need_RetentionLimit3y),
  max_retention_days(:Need_RetentionLimit3y, Max),
  permission(Graph, :PermRetention10y),
  clause(Graph, :PermRetention10y, :ClauseH4),
  retention_days(Graph, :PermRetention10y, Days),
  greater_than(Days, Max).

base_score(:riskH1, 85).
base_score(:riskH2, 90).
base_score(:riskH3, 80).
base_score(:riskH4, 55).
violates_need(:riskH1, :Need_ConsentForResearch).
violates_need(:riskH2, :Need_DeIdentifyBeforeSharing).
violates_need(:riskH3, :Need_HumanReviewForAutomatedTriage).
violates_need(:riskH4, :Need_RetentionLimit3y).
about_clause(:riskH1, :ClauseH1).
about_clause(:riskH2, :ClauseH2).
about_clause(:riskH3, :ClauseH3).
about_clause(:riskH4, :ClauseH4).
risk_source_of(:riskH1, :PermResearchUse).
risk_source_of(:riskH2, :PermShareWithPharma).
risk_source_of(:riskH3, :PermAutomatedTriage).
risk_source_of(:riskH4, :PermRetention10y).

description(:riskH1, "Risk: health/genomic data may be used for research without explicit opt-in consent.").
description(:riskH2, "Risk: genomic data may be shared with external pharma partners without a de-identification/pseudonymisation requirement.").
description(:riskH3, "Risk: automated triage may affect care pathways without a human review/override safeguard.").
description(:riskH4, "Risk: retention (3650 days) exceeds patient preference (1095 days).").

mitigation_graph(:riskH1, :MitigateConsent, graph([
  triple(:PermResearchUse, odrl:constraint, :CExplicitConsent),
  triple(:CExplicitConsent, odrl:leftOperand, :explicitConsent),
  triple(:CExplicitConsent, odrl:rightOperand, true)
])).
mitigation_graph(:riskH2, :MitigateDeId, graph([
  triple(:PermShareWithPharma, odrl:constraint, :CDeIdentified),
  triple(:CDeIdentified, odrl:leftOperand, :deIdentified),
  triple(:CDeIdentified, odrl:rightOperand, true),
  triple(:PermShareWithPharma, odrl:duty, :DutyDeIdentify),
  triple(:DutyDeIdentify, odrl:action, :deIdentify)
])).
mitigation_graph(:riskH3, :MitigateHumanReview, graph([
  triple(:PermAutomatedTriage, odrl:duty, :DutyHumanReview),
  triple(:DutyHumanReview, odrl:action, :humanReview)
])).
mitigation_graph(:riskH4, :MitigateRetention, graph([
  triple(:PermRetention10y, odrl:constraint, :CRetentionLimit),
  triple(:CRetentionLimit, odrl:leftOperand, :retentionDays),
  triple(:CRetentionLimit, odrl:rightOperand, 1095)
])).

score_raw(Risk, Raw) :-
  risk(Risk),
  base_score(Risk, Base),
  violates_need(Risk, Need),
  importance(Need, Weight),
  sum(Base, Weight, Raw).

score(Risk, 100) :- score_raw(Risk, Raw), greater_than(Raw, 100).
score(Risk, Raw) :- score_raw(Risk, Raw), not_less_than(100, Raw).

severity(Risk, risk:HighSeverity) :- score(Risk, Score), greater_than(Score, 79).
severity(Risk, risk:ModerateSeverity) :- score(Risk, Score), less_than(Score, 80), greater_than(Score, 49).
risk_level(Risk, risk:HighRisk) :- score(Risk, Score), greater_than(Score, 79).
risk_level(Risk, risk:ModerateRisk) :- score(Risk, Score), less_than(Score, 80), greater_than(Score, 49).

report_key(Risk, Key) :- score(Risk, Score), sub(1000, Score, Key).

triple(:AgreementHC1, :policyGraph, GraphTerm) :-
  agreement_policy_graph(:AgreementHC1, Graph),
  policy_graph(Graph, GraphTerm).

triple(:PolicyGraphHC1, :contains, triple(Subject, Predicate, Object)) :-
  policy_triple(:PolicyGraphHC1, Subject, Predicate, Object).

triple(:ProcessContextHC1, dpv:hasRisk, Risk) :- risk(Risk).
triple(Risk, rdf:type, dpv:Risk) :- risk(Risk).
triple(Risk, :scoreRaw, Raw) :- score_raw(Risk, Raw).
triple(Risk, :score, Score) :- score(Risk, Score).
triple(Risk, dpv:hasRiskLevel, Level) :- risk_level(Risk, Level).
triple(Risk, dpv:hasSeverity, Severity) :- severity(Risk, Severity).
triple(Risk, :aboutClause, Clause) :- risk(Risk), about_clause(Risk, Clause).
triple(Risk, :violatesNeed, Need) :- risk(Risk), violates_need(Risk, Need).
triple(Risk, dct:source, Source) :- risk(Risk), risk_source_of(Risk, Source).
triple(Risk, dct:description, Description) :- risk(Risk), description(Risk, Description).
triple(Risk, :reportKey, Key) :- report_key(Risk, Key).
triple(Risk, dpv:isMitigatedByMeasure, Mitigation) :- risk(Risk), mitigation_graph(Risk, Mitigation, _Graph).
triple(Mitigation, :suggestAddGraph, Graph) :- mitigation_graph(Risk, Mitigation, Graph), risk(Risk).
triple(:report, :firstRisk, :riskH1) :- score(:riskH1, 100), score(:riskH2, 100).
triple(:report, :retentionRiskScore, Score) :- score(:riskH4, Score).
