triple(agreement1, dct_title, "Example Agreement").
triple(agreement1, policyGraph, policyGraph1).
triple(clauseC1, clauseId, "C1").
triple(clauseC1, text, "Provider may remove the user account (and associated data) at its discretion.").
triple(clauseC2, clauseId, "C2").
triple(clauseC2, text, "Provider may change terms by informing users at least 3 days in advance.").
triple(clauseC3, clauseId, "C3").
triple(clauseC3, text, "Provider may share user data with partners for business purposes.").
triple(clauseC4, clauseId, "C4").
triple(clauseC4, text, "Users are not permitted to export their data.").
triple(consumerExample, dct_title, "Example consumer profile").
triple(m11, dct_description, "Add a notice constraint (minimum noticeDays) before account removal.").
triple(m11, dpv_mitigatesRisk, risk1).
triple(m11, rdf_type, dpv_RiskMitigationMeasure).
triple(m12, dct_description, "Increase minimum noticeDays in the inform duty to meet the consumer requirement.").
triple(m12, dpv_mitigatesRisk, risk2).
triple(m12, rdf_type, dpv_RiskMitigationMeasure).
triple(m13, dct_description, "Add an explicit consent constraint before data sharing.").
triple(m13, dpv_mitigatesRisk, risk3).
triple(m13, rdf_type, dpv_RiskMitigationMeasure).
triple(m14, dct_description, "Add a permission allowing data export (or remove the prohibition) to support portability.").
triple(m14, dpv_mitigatesRisk, risk4).
triple(m14, rdf_type, dpv_RiskMitigationMeasure).
triple(m21, dct_description, "Add a duty to inform the consumer prior to account removal.").
triple(m21, dpv_mitigatesRisk, risk1).
triple(m21, rdf_type, dpv_RiskMitigationMeasure).
triple(policyGraph1, contains, triple(permChangeTerms, clause, clauseC2)).
triple(policyGraph1, contains, triple(permChangeTerms, noticeDays, 3)).
triple(policyGraph1, contains, triple(permChangeTerms, odrl_action, tosl_changeTerms)).
triple(policyGraph1, contains, triple(permChangeTerms, odrl_assignee, consumerExample)).
triple(policyGraph1, contains, triple(permChangeTerms, odrl_assigner, provider)).
triple(policyGraph1, contains, triple(permChangeTerms, odrl_duty, odrl_inform)).
triple(policyGraph1, contains, triple(permChangeTerms, odrl_target, agreementText)).
triple(policyGraph1, contains, triple(permDeleteAccount, clause, clauseC1)).
triple(policyGraph1, contains, triple(permDeleteAccount, odrl_action, tosl_removeAccount)).
triple(policyGraph1, contains, triple(permDeleteAccount, odrl_assignee, consumerExample)).
triple(policyGraph1, contains, triple(permDeleteAccount, odrl_assigner, provider)).
triple(policyGraph1, contains, triple(permDeleteAccount, odrl_target, userAccount)).
triple(policyGraph1, contains, triple(permShareData, clause, clauseC3)).
triple(policyGraph1, contains, triple(permShareData, odrl_action, tosl_shareData)).
triple(policyGraph1, contains, triple(permShareData, odrl_assignee, consumerExample)).
triple(policyGraph1, contains, triple(permShareData, odrl_assigner, provider)).
triple(policyGraph1, contains, triple(permShareData, odrl_target, userData)).
triple(policyGraph1, contains, triple(policy1, odrl_appliesTo, agreement1)).
triple(policyGraph1, contains, triple(policy1, odrl_permission, permChangeTerms)).
triple(policyGraph1, contains, triple(policy1, odrl_permission, permDeleteAccount)).
triple(policyGraph1, contains, triple(policy1, odrl_permission, permShareData)).
triple(policyGraph1, contains, triple(policy1, odrl_prohibition, prohibitExportData)).
triple(policyGraph1, contains, triple(policy1, rdf_type, odrl_Policy)).
triple(policyGraph1, contains, triple(prohibitExportData, clause, clauseC4)).
triple(policyGraph1, contains, triple(prohibitExportData, odrl_action, tosl_exportData)).
triple(policyGraph1, contains, triple(prohibitExportData, odrl_assignee, consumerExample)).
triple(policyGraph1, contains, triple(prohibitExportData, odrl_assigner, provider)).
triple(policyGraph1, contains, triple(prohibitExportData, odrl_target, userData)).
triple(policyGraph1, rdf_type, policyGraph).
triple(processContext1, dct_title, "Service operation under Agreement1").
triple(processContext1, dpv_hasRisk, risk1).
triple(processContext1, dpv_hasRisk, risk2).
triple(processContext1, dpv_hasRisk, risk3).
triple(processContext1, dpv_hasRisk, risk4).
triple(report, firstRisk, risk1).
triple(report, profile, consumerExample).
triple(report, source, agreement1).
triple(risk1, aboutClause, clauseC1).
triple(risk1, dct_description, "Risk: account/data removal is permitted without notice safeguards (no notice constraint and no duty to inform). Clause C1: Provider may remove the user account (and associated data) at its discretion.").
triple(risk1, dct_source, permDeleteAccount).
triple(risk1, dpv_hasConsequence, risk_CustomerConfidenceLoss).
triple(risk1, dpv_hasConsequence, risk_DataLoss).
triple(risk1, dpv_hasConsequence, risk_DataUnavailable).
triple(risk1, dpv_hasImpact, risk_FinancialLoss).
triple(risk1, dpv_hasImpact, risk_NonMaterialDamage).
triple(risk1, dpv_hasRiskLevel, risk_HighRisk).
triple(risk1, dpv_hasSeverity, risk_HighSeverity).
triple(risk1, dpv_isMitigatedByMeasure, m11).
triple(risk1, dpv_isMitigatedByMeasure, m21).
triple(risk1, rdf_type, dpv_Risk).
triple(risk1, rdf_type, risk_DataErasureError).
triple(risk1, rdf_type, risk_DataLoss).
triple(risk1, rdf_type, risk_DataUnavailable).
triple(risk1, rdf_type, risk_UnwantedDataDeletion).
triple(risk1, reportKey, key(900, "C1")).
triple(risk1, risk_hasRiskSource, src1).
triple(risk1, score, 100).
triple(risk1, scoreRaw, 110).
triple(risk1, violatesNeed, need_DataCannotBeRemoved).
triple(risk2, aboutClause, clauseC2).
triple(risk2, dct_description, "Risk: terms may change with notice (3 days) below consumer requirement (14 days). Clause C2: Provider may change terms by informing users at least 3 days in advance.").
triple(risk2, dct_source, permChangeTerms).
triple(risk2, dpv_hasConsequence, risk_CustomerConfidenceLoss).
triple(risk2, dpv_hasImpact, risk_NonMaterialDamage).
triple(risk2, dpv_hasRiskLevel, risk_HighRisk).
triple(risk2, dpv_hasSeverity, risk_HighSeverity).
triple(risk2, dpv_isMitigatedByMeasure, m12).
triple(risk2, rdf_type, dpv_Risk).
triple(risk2, rdf_type, risk_CustomerConfidenceLoss).
triple(risk2, rdf_type, risk_PolicyRisk).
triple(risk2, reportKey, key(915, "C2")).
triple(risk2, risk_hasRiskSource, src2).
triple(risk2, score, 85).
triple(risk2, scoreRaw, 85).
triple(risk2, violatesNeed, need_ChangeOnlyWithPriorNotice).
triple(risk3, aboutClause, clauseC3).
triple(risk3, dct_description, "Risk: user data sharing is permitted without an explicit consent constraint. Clause C3: Provider may share user data with partners for business purposes.").
triple(risk3, dct_source, permShareData).
triple(risk3, dpv_hasConsequence, risk_CustomerConfidenceLoss).
triple(risk3, dpv_hasImpact, risk_FinancialLoss).
triple(risk3, dpv_hasImpact, risk_NonMaterialDamage).
triple(risk3, dpv_hasRiskLevel, risk_HighRisk).
triple(risk3, dpv_hasSeverity, risk_HighSeverity).
triple(risk3, dpv_isMitigatedByMeasure, m13).
triple(risk3, rdf_type, dpv_Risk).
triple(risk3, rdf_type, risk_CustomerConfidenceLoss).
triple(risk3, rdf_type, risk_UnwantedDisclosureData).
triple(risk3, reportKey, key(903, "C3")).
triple(risk3, risk_hasRiskSource, src3).
triple(risk3, score, 97).
triple(risk3, scoreRaw, 97).
triple(risk3, violatesNeed, need_NoSharingWithoutConsent).
triple(risk4, aboutClause, clauseC4).
triple(risk4, dct_description, "Risk: portability is restricted because exporting user data is prohibited. Clause C4: Users are not permitted to export their data.").
triple(risk4, dct_source, prohibitExportData).
triple(risk4, dpv_hasConsequence, risk_CustomerConfidenceLoss).
triple(risk4, dpv_hasImpact, risk_NonMaterialDamage).
triple(risk4, dpv_hasRiskLevel, risk_ModerateRisk).
triple(risk4, dpv_hasSeverity, risk_ModerateSeverity).
triple(risk4, dpv_isMitigatedByMeasure, m14).
triple(risk4, rdf_type, dpv_Risk).
triple(risk4, rdf_type, risk_CustomerConfidenceLoss).
triple(risk4, rdf_type, risk_PolicyRisk).
triple(risk4, reportKey, key(930, "C4")).
triple(risk4, risk_hasRiskSource, src4).
triple(risk4, score, 70).
triple(risk4, scoreRaw, 70).
triple(risk4, violatesNeed, need_DataPortability).
triple(riskRanking, before, pair(risk1, risk2)).
triple(riskRanking, before, pair(risk1, risk3)).
triple(riskRanking, before, pair(risk1, risk4)).
triple(riskRanking, before, pair(risk2, risk4)).
triple(riskRanking, before, pair(risk3, risk2)).
triple(riskRanking, before, pair(risk3, risk4)).
triple(src1, dct_source, permDeleteAccount).
triple(src1, rdf_type, risk_LegalComplianceRisk).
triple(src1, rdf_type, risk_RiskSource).
triple(src2, dct_source, permChangeTerms).
triple(src2, rdf_type, risk_PolicyRisk).
triple(src2, rdf_type, risk_RiskSource).
triple(src3, dct_source, permShareData).
triple(src3, rdf_type, risk_PolicyRisk).
triple(src3, rdf_type, risk_RiskSource).
triple(src4, dct_source, prohibitExportData).
triple(src4, rdf_type, risk_PolicyRisk).
triple(src4, rdf_type, risk_RiskSource).
