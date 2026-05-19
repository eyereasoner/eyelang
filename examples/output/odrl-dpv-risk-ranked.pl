triple(:Agreement1, :policyGraph, :PolicyGraph1).
triple(:Agreement1, dct:title, "Example Agreement").
triple(:ClauseC1, :clauseId, "C1").
triple(:ClauseC1, :text, "Provider may remove the user account (and associated data) at its discretion.").
triple(:ClauseC2, :clauseId, "C2").
triple(:ClauseC2, :text, "Provider may change terms by informing users at least 3 days in advance.").
triple(:ClauseC3, :clauseId, "C3").
triple(:ClauseC3, :text, "Provider may share user data with partners for business purposes.").
triple(:ClauseC4, :clauseId, "C4").
triple(:ClauseC4, :text, "Users are not permitted to export their data.").
triple(:ConsumerExample, dct:title, "Example consumer profile").
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, :clause, :ClauseC2)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, :noticeDays, 3)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, odrl:action, tosl:changeTerms)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, odrl:assignee, :ConsumerExample)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, odrl:assigner, :Provider)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, odrl:duty, odrl:inform)).
triple(:PolicyGraph1, :contains, triple(:PermChangeTerms, odrl:target, :AgreementText)).
triple(:PolicyGraph1, :contains, triple(:PermDeleteAccount, :clause, :ClauseC1)).
triple(:PolicyGraph1, :contains, triple(:PermDeleteAccount, odrl:action, tosl:removeAccount)).
triple(:PolicyGraph1, :contains, triple(:PermDeleteAccount, odrl:assignee, :ConsumerExample)).
triple(:PolicyGraph1, :contains, triple(:PermDeleteAccount, odrl:assigner, :Provider)).
triple(:PolicyGraph1, :contains, triple(:PermDeleteAccount, odrl:target, :UserAccount)).
triple(:PolicyGraph1, :contains, triple(:PermShareData, :clause, :ClauseC3)).
triple(:PolicyGraph1, :contains, triple(:PermShareData, odrl:action, tosl:shareData)).
triple(:PolicyGraph1, :contains, triple(:PermShareData, odrl:assignee, :ConsumerExample)).
triple(:PolicyGraph1, :contains, triple(:PermShareData, odrl:assigner, :Provider)).
triple(:PolicyGraph1, :contains, triple(:PermShareData, odrl:target, :UserData)).
triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:appliesTo, :Agreement1)).
triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:permission, :PermChangeTerms)).
triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:permission, :PermDeleteAccount)).
triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:permission, :PermShareData)).
triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:prohibition, :ProhibitExportData)).
triple(:PolicyGraph1, :contains, triple(:Policy1, rdf:type, odrl:Policy)).
triple(:PolicyGraph1, :contains, triple(:ProhibitExportData, :clause, :ClauseC4)).
triple(:PolicyGraph1, :contains, triple(:ProhibitExportData, odrl:action, tosl:exportData)).
triple(:PolicyGraph1, :contains, triple(:ProhibitExportData, odrl:assignee, :ConsumerExample)).
triple(:PolicyGraph1, :contains, triple(:ProhibitExportData, odrl:assigner, :Provider)).
triple(:PolicyGraph1, :contains, triple(:ProhibitExportData, odrl:target, :UserData)).
triple(:PolicyGraph1, rdf:type, :PolicyGraph).
triple(:ProcessContext1, dct:title, "Service operation under Agreement1").
triple(:ProcessContext1, dpv:hasRisk, :risk1).
triple(:ProcessContext1, dpv:hasRisk, :risk2).
triple(:ProcessContext1, dpv:hasRisk, :risk3).
triple(:ProcessContext1, dpv:hasRisk, :risk4).
triple(:m11, dct:description, "Add a notice constraint (minimum noticeDays) before account removal.").
triple(:m11, dpv:mitigatesRisk, :risk1).
triple(:m11, rdf:type, dpv:RiskMitigationMeasure).
triple(:m12, dct:description, "Increase minimum noticeDays in the inform duty to meet the consumer requirement.").
triple(:m12, dpv:mitigatesRisk, :risk2).
triple(:m12, rdf:type, dpv:RiskMitigationMeasure).
triple(:m13, dct:description, "Add an explicit consent constraint before data sharing.").
triple(:m13, dpv:mitigatesRisk, :risk3).
triple(:m13, rdf:type, dpv:RiskMitigationMeasure).
triple(:m14, dct:description, "Add a permission allowing data export (or remove the prohibition) to support portability.").
triple(:m14, dpv:mitigatesRisk, :risk4).
triple(:m14, rdf:type, dpv:RiskMitigationMeasure).
triple(:m21, dct:description, "Add a duty to inform the consumer prior to account removal.").
triple(:m21, dpv:mitigatesRisk, :risk1).
triple(:m21, rdf:type, dpv:RiskMitigationMeasure).
triple(:report, :firstRisk, :risk1).
triple(:report, :profile, :ConsumerExample).
triple(:report, :source, :Agreement1).
triple(:risk1, :aboutClause, :ClauseC1).
triple(:risk1, :reportKey, key(900, "C1")).
triple(:risk1, :score, 100).
triple(:risk1, :scoreRaw, 110).
triple(:risk1, :violatesNeed, :Need_DataCannotBeRemoved).
triple(:risk1, dct:description, "Risk: account/data removal is permitted without notice safeguards (no notice constraint and no duty to inform). Clause C1: Provider may remove the user account (and associated data) at its discretion.").
triple(:risk1, dct:source, :PermDeleteAccount).
triple(:risk1, dpv:hasConsequence, risk:CustomerConfidenceLoss).
triple(:risk1, dpv:hasConsequence, risk:DataLoss).
triple(:risk1, dpv:hasConsequence, risk:DataUnavailable).
triple(:risk1, dpv:hasImpact, risk:FinancialLoss).
triple(:risk1, dpv:hasImpact, risk:NonMaterialDamage).
triple(:risk1, dpv:hasRiskLevel, risk:HighRisk).
triple(:risk1, dpv:hasSeverity, risk:HighSeverity).
triple(:risk1, dpv:isMitigatedByMeasure, :m11).
triple(:risk1, dpv:isMitigatedByMeasure, :m21).
triple(:risk1, rdf:type, dpv:Risk).
triple(:risk1, rdf:type, risk:DataErasureError).
triple(:risk1, rdf:type, risk:DataLoss).
triple(:risk1, rdf:type, risk:DataUnavailable).
triple(:risk1, rdf:type, risk:UnwantedDataDeletion).
triple(:risk1, risk:hasRiskSource, :src1).
triple(:risk2, :aboutClause, :ClauseC2).
triple(:risk2, :reportKey, key(915, "C2")).
triple(:risk2, :score, 85).
triple(:risk2, :scoreRaw, 85).
triple(:risk2, :violatesNeed, :Need_ChangeOnlyWithPriorNotice).
triple(:risk2, dct:description, "Risk: terms may change with notice (3 days) below consumer requirement (14 days). Clause C2: Provider may change terms by informing users at least 3 days in advance.").
triple(:risk2, dct:source, :PermChangeTerms).
triple(:risk2, dpv:hasConsequence, risk:CustomerConfidenceLoss).
triple(:risk2, dpv:hasImpact, risk:NonMaterialDamage).
triple(:risk2, dpv:hasRiskLevel, risk:HighRisk).
triple(:risk2, dpv:hasSeverity, risk:HighSeverity).
triple(:risk2, dpv:isMitigatedByMeasure, :m12).
triple(:risk2, rdf:type, dpv:Risk).
triple(:risk2, rdf:type, risk:CustomerConfidenceLoss).
triple(:risk2, rdf:type, risk:PolicyRisk).
triple(:risk2, risk:hasRiskSource, :src2).
triple(:risk3, :aboutClause, :ClauseC3).
triple(:risk3, :reportKey, key(903, "C3")).
triple(:risk3, :score, 97).
triple(:risk3, :scoreRaw, 97).
triple(:risk3, :violatesNeed, :Need_NoSharingWithoutConsent).
triple(:risk3, dct:description, "Risk: user data sharing is permitted without an explicit consent constraint. Clause C3: Provider may share user data with partners for business purposes.").
triple(:risk3, dct:source, :PermShareData).
triple(:risk3, dpv:hasConsequence, risk:CustomerConfidenceLoss).
triple(:risk3, dpv:hasImpact, risk:FinancialLoss).
triple(:risk3, dpv:hasImpact, risk:NonMaterialDamage).
triple(:risk3, dpv:hasRiskLevel, risk:HighRisk).
triple(:risk3, dpv:hasSeverity, risk:HighSeverity).
triple(:risk3, dpv:isMitigatedByMeasure, :m13).
triple(:risk3, rdf:type, dpv:Risk).
triple(:risk3, rdf:type, risk:CustomerConfidenceLoss).
triple(:risk3, rdf:type, risk:UnwantedDisclosureData).
triple(:risk3, risk:hasRiskSource, :src3).
triple(:risk4, :aboutClause, :ClauseC4).
triple(:risk4, :reportKey, key(930, "C4")).
triple(:risk4, :score, 70).
triple(:risk4, :scoreRaw, 70).
triple(:risk4, :violatesNeed, :Need_DataPortability).
triple(:risk4, dct:description, "Risk: portability is restricted because exporting user data is prohibited. Clause C4: Users are not permitted to export their data.").
triple(:risk4, dct:source, :ProhibitExportData).
triple(:risk4, dpv:hasConsequence, risk:CustomerConfidenceLoss).
triple(:risk4, dpv:hasImpact, risk:NonMaterialDamage).
triple(:risk4, dpv:hasRiskLevel, risk:ModerateRisk).
triple(:risk4, dpv:hasSeverity, risk:ModerateSeverity).
triple(:risk4, dpv:isMitigatedByMeasure, :m14).
triple(:risk4, rdf:type, dpv:Risk).
triple(:risk4, rdf:type, risk:CustomerConfidenceLoss).
triple(:risk4, rdf:type, risk:PolicyRisk).
triple(:risk4, risk:hasRiskSource, :src4).
triple(:riskRanking, :before, pair(:risk1, :risk2)).
triple(:riskRanking, :before, pair(:risk1, :risk3)).
triple(:riskRanking, :before, pair(:risk1, :risk4)).
triple(:riskRanking, :before, pair(:risk2, :risk4)).
triple(:riskRanking, :before, pair(:risk3, :risk2)).
triple(:riskRanking, :before, pair(:risk3, :risk4)).
triple(:src1, dct:source, :PermDeleteAccount).
triple(:src1, rdf:type, risk:LegalComplianceRisk).
triple(:src1, rdf:type, risk:RiskSource).
triple(:src2, dct:source, :PermChangeTerms).
triple(:src2, rdf:type, risk:PolicyRisk).
triple(:src2, rdf:type, risk:RiskSource).
triple(:src3, dct:source, :PermShareData).
triple(:src3, rdf:type, risk:PolicyRisk).
triple(:src3, rdf:type, risk:RiskSource).
triple(:src4, dct:source, :ProhibitExportData).
triple(:src4, rdf:type, risk:PolicyRisk).
triple(:src4, rdf:type, risk:RiskSource).
