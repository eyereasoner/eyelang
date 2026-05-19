% ODRL + DPV ranked-risk assessment adapted from Eyeling odrl-dpv-risk-ranked.n3.
% Eyeling keeps the ODRL rules inside an N3 quoted policy graph and prints a
% Markdown report with log:outputString.  This Eyelog translation also keeps the
% policy as a graph-valued term, projects local predicates from that graph for
% reasoning, and materializes the derived DPV risks as triple/3 output.

% Consumer profile and needs.
consumer(:ConsumerExample).
title(:ConsumerExample, "Example consumer profile").
has_need(:ConsumerExample, :Need_DataCannotBeRemoved).
has_need(:ConsumerExample, :Need_ChangeOnlyWithPriorNotice).
has_need(:ConsumerExample, :Need_NoSharingWithoutConsent).
has_need(:ConsumerExample, :Need_DataPortability).

importance(:Need_DataCannotBeRemoved, 20).
description(:Need_DataCannotBeRemoved, "Provider must not remove the consumer account/data.").
importance(:Need_ChangeOnlyWithPriorNotice, 15).
min_notice_days(:Need_ChangeOnlyWithPriorNotice, 14).
description(:Need_ChangeOnlyWithPriorNotice, "Agreement may change only with prior notice (>= 14 days).").
importance(:Need_NoSharingWithoutConsent, 12).
description(:Need_NoSharingWithoutConsent, "No data sharing without explicit consent.").
importance(:Need_DataPortability, 10).
description(:Need_DataPortability, "Consumer must be able to export their data.").

% Agreement and ODRL-style policy structure.
agreement(:Agreement1).
title(:Agreement1, "Example Agreement").
process_context(:ProcessContext1, :Agreement1).
title(:ProcessContext1, "Service operation under Agreement1").

% The ODRL policy is kept as a graph value.  The clauses below are not asserted
% globally as permission/2, prohibition/2, action/2, ... facts; they are
% triple/3 terms inside :PolicyGraph1.  The local projection predicates below read from the
% graph when evaluating this agreement.  This mirrors N3 quoted graphs and avoids
% making policy triples true outside the graph that contains them.
policy_graph(:PolicyGraph1, graph([
  triple(:Policy1, rdf:type, odrl:Policy),
  triple(:Policy1, odrl:appliesTo, :Agreement1),
  triple(:Policy1, odrl:permission, :PermDeleteAccount),
  triple(:Policy1, odrl:permission, :PermChangeTerms),
  triple(:Policy1, odrl:permission, :PermShareData),
  triple(:Policy1, odrl:prohibition, :ProhibitExportData),

  triple(:PermDeleteAccount, odrl:assigner, :Provider),
  triple(:PermDeleteAccount, odrl:assignee, :ConsumerExample),
  triple(:PermDeleteAccount, odrl:action, tosl:removeAccount),
  triple(:PermDeleteAccount, odrl:target, :UserAccount),
  triple(:PermDeleteAccount, :clause, :ClauseC1),

  triple(:PermChangeTerms, odrl:assigner, :Provider),
  triple(:PermChangeTerms, odrl:assignee, :ConsumerExample),
  triple(:PermChangeTerms, odrl:action, tosl:changeTerms),
  triple(:PermChangeTerms, odrl:target, :AgreementText),
  triple(:PermChangeTerms, :clause, :ClauseC2),
  triple(:PermChangeTerms, odrl:duty, odrl:inform),
  triple(:PermChangeTerms, :noticeDays, 3),

  triple(:PermShareData, odrl:assigner, :Provider),
  triple(:PermShareData, odrl:assignee, :ConsumerExample),
  triple(:PermShareData, odrl:action, tosl:shareData),
  triple(:PermShareData, odrl:target, :UserData),
  triple(:PermShareData, :clause, :ClauseC3),

  triple(:ProhibitExportData, odrl:assigner, :Provider),
  triple(:ProhibitExportData, odrl:assignee, :ConsumerExample),
  triple(:ProhibitExportData, odrl:action, tosl:exportData),
  triple(:ProhibitExportData, odrl:target, :UserData),
  triple(:ProhibitExportData, :clause, :ClauseC4)
])).

policy_triple(Subject, Predicate, Object) :-
  policy_graph(_Graph, graph(Statements)),
  member(triple(Subject, Predicate, Object), Statements).

policy(Policy, Agreement) :- policy_triple(Policy, odrl:appliesTo, Agreement).
permission(Policy, Rule) :- policy_triple(Policy, odrl:permission, Rule).
prohibition(Policy, Rule) :- policy_triple(Policy, odrl:prohibition, Rule).
assigner(Rule, Party) :- policy_triple(Rule, odrl:assigner, Party).
assignee(Rule, Party) :- policy_triple(Rule, odrl:assignee, Party).
action(Rule, Action) :- policy_triple(Rule, odrl:action, Action).
target(Rule, Target) :- policy_triple(Rule, odrl:target, Target).
clause(Rule, Clause) :- policy_triple(Rule, :clause, Clause).
duty(Rule, Duty) :- policy_triple(Rule, odrl:duty, Duty).
notice_days(Rule, Days) :- policy_triple(Rule, :noticeDays, Days).
consent_constraint(Rule, Value) :- policy_triple(Rule, :consentConstraint, Value).

clause_id(:ClauseC1, "C1").
clause_text(:ClauseC1, "Provider may remove the user account (and associated data) at its discretion.").
clause_id(:ClauseC2, "C2").
clause_text(:ClauseC2, "Provider may change terms by informing users at least 3 days in advance.").
clause_id(:ClauseC3, "C3").
clause_text(:ClauseC3, "Provider may share user data with partners for business purposes.").
clause_id(:ClauseC4, "C4").
clause_text(:ClauseC4, "Users are not permitted to export their data.").

% Missing-safeguard checks corresponding to the log:notIncludes tests in N3.
missing_notice_constraint(Perm) :-
  permission(:Policy1, Perm),
  not(notice_days(Perm, _Days)).

missing_inform_duty(Perm) :-
  permission(:Policy1, Perm),
  not(duty(Perm, odrl:inform)).

missing_consent_constraint(Perm) :-
  permission(:Policy1, Perm),
  action(Perm, tosl:shareData),
  not(consent_constraint(Perm, true)).

% ODRL -> DPV risk derivation.
risk(:risk1) :-
  has_need(:ConsumerExample, :Need_DataCannotBeRemoved),
  permission(:Policy1, :PermDeleteAccount),
  action(:PermDeleteAccount, tosl:removeAccount),
  missing_notice_constraint(:PermDeleteAccount),
  missing_inform_duty(:PermDeleteAccount).

risk_source(:risk1, :src1).
risk_class(:risk1, risk:UnwantedDataDeletion).
risk_class(:risk1, risk:DataUnavailable).
risk_class(:risk1, risk:DataErasureError).
risk_class(:risk1, risk:DataLoss).
risk_source_class(:src1, risk:LegalComplianceRisk).
risk_source_of(:src1, :PermDeleteAccount).
risk_consequence(:risk1, risk:DataLoss).
risk_consequence(:risk1, risk:DataUnavailable).
risk_consequence(:risk1, risk:CustomerConfidenceLoss).
risk_impact(:risk1, risk:FinancialLoss).
risk_impact(:risk1, risk:NonMaterialDamage).
about_clause(:risk1, :ClauseC1).
violates_need(:risk1, :Need_DataCannotBeRemoved).
risk_description(:risk1, "Risk: account/data removal is permitted without notice safeguards (no notice constraint and no duty to inform). Clause C1: Provider may remove the user account (and associated data) at its discretion.").
base_score(:risk1, 90).
mitigation(:risk1, :m11, "Add a notice constraint (minimum noticeDays) before account removal.").
mitigation(:risk1, :m21, "Add a duty to inform the consumer prior to account removal.").

risk(:risk2) :-
  has_need(:ConsumerExample, :Need_ChangeOnlyWithPriorNotice),
  min_notice_days(:Need_ChangeOnlyWithPriorNotice, Required),
  permission(:Policy1, :PermChangeTerms),
  action(:PermChangeTerms, tosl:changeTerms),
  duty(:PermChangeTerms, odrl:inform),
  notice_days(:PermChangeTerms, Days),
  math:lessThan(Days, Required).

risk_source(:risk2, :src2).
risk_class(:risk2, risk:PolicyRisk).
risk_class(:risk2, risk:CustomerConfidenceLoss).
risk_source_class(:src2, risk:PolicyRisk).
risk_source_of(:src2, :PermChangeTerms).
risk_consequence(:risk2, risk:CustomerConfidenceLoss).
risk_impact(:risk2, risk:NonMaterialDamage).
about_clause(:risk2, :ClauseC2).
violates_need(:risk2, :Need_ChangeOnlyWithPriorNotice).
risk_description(:risk2, "Risk: terms may change with notice (3 days) below consumer requirement (14 days). Clause C2: Provider may change terms by informing users at least 3 days in advance.").
base_score(:risk2, 70).
mitigation(:risk2, :m12, "Increase minimum noticeDays in the inform duty to meet the consumer requirement.").

risk(:risk3) :-
  has_need(:ConsumerExample, :Need_NoSharingWithoutConsent),
  permission(:Policy1, :PermShareData),
  action(:PermShareData, tosl:shareData),
  missing_consent_constraint(:PermShareData).

risk_source(:risk3, :src3).
risk_class(:risk3, risk:UnwantedDisclosureData).
risk_class(:risk3, risk:CustomerConfidenceLoss).
risk_source_class(:src3, risk:PolicyRisk).
risk_source_of(:src3, :PermShareData).
risk_consequence(:risk3, risk:CustomerConfidenceLoss).
risk_impact(:risk3, risk:NonMaterialDamage).
risk_impact(:risk3, risk:FinancialLoss).
about_clause(:risk3, :ClauseC3).
violates_need(:risk3, :Need_NoSharingWithoutConsent).
risk_description(:risk3, "Risk: user data sharing is permitted without an explicit consent constraint. Clause C3: Provider may share user data with partners for business purposes.").
base_score(:risk3, 85).
mitigation(:risk3, :m13, "Add an explicit consent constraint before data sharing.").

risk(:risk4) :-
  has_need(:ConsumerExample, :Need_DataPortability),
  prohibition(:Policy1, :ProhibitExportData),
  action(:ProhibitExportData, tosl:exportData).

risk_source(:risk4, :src4).
risk_class(:risk4, risk:PolicyRisk).
risk_class(:risk4, risk:CustomerConfidenceLoss).
risk_source_class(:src4, risk:PolicyRisk).
risk_source_of(:src4, :ProhibitExportData).
risk_consequence(:risk4, risk:CustomerConfidenceLoss).
risk_impact(:risk4, risk:NonMaterialDamage).
about_clause(:risk4, :ClauseC4).
violates_need(:risk4, :Need_DataPortability).
risk_description(:risk4, "Risk: portability is restricted because exporting user data is prohibited. Clause C4: Users are not permitted to export their data.").
base_score(:risk4, 60).
mitigation(:risk4, :m14, "Add a permission allowing data export (or remove the prohibition) to support portability.").

score_raw(Risk, Raw) :-
  risk(Risk),
  base_score(Risk, Base),
  violates_need(Risk, Need),
  importance(Need, Weight),
  math:sum(Base, Weight, Raw).

score(Risk, 100) :-
  score_raw(Risk, Raw),
  math:greaterThan(Raw, 100).

score(Risk, Raw) :-
  score_raw(Risk, Raw),
  math:notLessThan(100, Raw).

severity(Risk, risk:HighSeverity) :-
  score(Risk, Score),
  math:greaterThan(Score, 79).

risk_level(Risk, risk:HighRisk) :-
  score(Risk, Score),
  math:greaterThan(Score, 79).

severity(Risk, risk:ModerateSeverity) :-
  score(Risk, Score),
  math:lessThan(Score, 80),
  math:greaterThan(Score, 49).

risk_level(Risk, risk:ModerateRisk) :-
  score(Risk, Score),
  math:lessThan(Score, 80),
  math:greaterThan(Score, 49).

severity(Risk, risk:LowSeverity) :-
  score(Risk, Score),
  math:lessThan(Score, 50).

risk_level(Risk, risk:LowRisk) :-
  score(Risk, Score),
  math:lessThan(Score, 50).

report_key(Risk, key(InvScore, ClauseId)) :-
  risk(Risk),
  score(Risk, Score),
  math:difference(1000, Score, InvScore),
  about_clause(Risk, Clause),
  clause_id(Clause, ClauseId).

ranked_before(Left, Right) :-
  report_key(Left, key(LeftInv, _LeftClause)),
  report_key(Right, key(RightInv, _RightClause)),
  math:lessThan(LeftInv, RightInv).

ranked_before(Left, Right) :-
  report_key(Left, key(Inv, LeftClause)),
  report_key(Right, key(Inv, RightClause)),
  string:notMatches(LeftClause, RightClause),
  math:lessThan(LeftClause, RightClause).

% Output layer.
triple(:Agreement1, dct:title, Title) :- title(:Agreement1, Title).
triple(:ConsumerExample, dct:title, Title) :- title(:ConsumerExample, Title).
triple(:ProcessContext1, dct:title, Title) :- title(:ProcessContext1, Title).
triple(:ProcessContext1, dpv:hasRisk, Risk) :- risk(Risk).
triple(:PolicyGraph1, rdf:type, :PolicyGraph).
triple(:Agreement1, :policyGraph, :PolicyGraph1).
triple(:PolicyGraph1, :contains, triple(Subject, Predicate, Object)) :-
  policy_triple(Subject, Predicate, Object).
triple(:report, :source, :Agreement1).
triple(:report, :profile, :ConsumerExample).
triple(:report, :firstRisk, Risk) :- risk(Risk), not(ranked_before(_Other, Risk)).
triple(:riskRanking, :before, pair(Left, Right)) :- ranked_before(Left, Right).

triple(Risk, rdf:type, dpv:Risk) :- risk(Risk).
triple(Risk, rdf:type, Class) :- risk(Risk), risk_class(Risk, Class).
triple(Risk, dct:source, Source) :- risk(Risk), risk_source(Risk, Src), risk_source_of(Src, Source).
triple(Risk, risk:hasRiskSource, Src) :- risk(Risk), risk_source(Risk, Src).
triple(Src, rdf:type, risk:RiskSource) :- risk_source(_Risk, Src).
triple(Src, rdf:type, Class) :- risk_source_class(Src, Class).
triple(Src, dct:source, Source) :- risk_source_of(Src, Source).
triple(Risk, dpv:hasConsequence, Consequence) :- risk(Risk), risk_consequence(Risk, Consequence).
triple(Risk, dpv:hasImpact, Impact) :- risk(Risk), risk_impact(Risk, Impact).
triple(Risk, :aboutClause, Clause) :- risk(Risk), about_clause(Risk, Clause).
triple(Risk, :violatesNeed, Need) :- risk(Risk), violates_need(Risk, Need).
triple(Risk, :scoreRaw, Raw) :- score_raw(Risk, Raw).
triple(Risk, :score, Score) :- score(Risk, Score).
triple(Risk, dpv:hasSeverity, Severity) :- severity(Risk, Severity).
triple(Risk, dpv:hasRiskLevel, Level) :- risk_level(Risk, Level).
triple(Risk, dct:description, Text) :- risk(Risk), risk_description(Risk, Text).
triple(Risk, :reportKey, Key) :- report_key(Risk, Key).
triple(Risk, dpv:isMitigatedByMeasure, Measure) :- mitigation(Risk, Measure, _Text).
triple(Measure, rdf:type, dpv:RiskMitigationMeasure) :- mitigation(_Risk, Measure, _Text).
triple(Measure, dpv:mitigatesRisk, Risk) :- mitigation(Risk, Measure, _Text).
triple(Measure, dct:description, Text) :- mitigation(_Risk, Measure, Text).
triple(Clause, :clauseId, Id) :- clause_id(Clause, Id).
triple(Clause, :text, Text) :- clause_text(Clause, Text).
