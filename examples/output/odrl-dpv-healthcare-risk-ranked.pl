triple(agreementHC1, policyGraph, (triple(policyHC1, rdf_type, odrl_Policy), triple(policyHC1, odrl_permission, permResearchUse), triple(policyHC1, odrl_permission, permShareWithPharma), triple(policyHC1, odrl_permission, permAutomatedTriage), triple(policyHC1, odrl_permission, permRetention10y), triple(permResearchUse, rdf_type, odrl_Permission), triple(permResearchUse, odrl_assigner, hospital), triple(permResearchUse, odrl_assignee, researchUnit), triple(permResearchUse, odrl_action, hl7ca_use), triple(permResearchUse, odrl_target, healthRecordData), triple(permResearchUse, odrl_target, genomicData), triple(permResearchUse, odrl_constraint, cResearchPurpose), triple(cResearchPurpose, odrl_leftOperand, odrl_purpose), triple(cResearchPurpose, odrl_rightOperandReference, purposeHMB), triple(permResearchUse, clause, clauseH1), triple(permShareWithPharma, rdf_type, odrl_Permission), triple(permShareWithPharma, odrl_assigner, hospital), triple(permShareWithPharma, odrl_assignee, pharmaPartner), triple(permShareWithPharma, odrl_action, hl7ca_disclose), triple(permShareWithPharma, odrl_target, genomicData), triple(permShareWithPharma, odrl_constraint, cSharePurpose), triple(cSharePurpose, odrl_leftOperand, odrl_purpose), triple(cSharePurpose, odrl_rightOperandReference, purposeHMB), triple(permShareWithPharma, clause, clauseH2), triple(permAutomatedTriage, rdf_type, odrl_Permission), triple(permAutomatedTriage, odrl_assigner, hospital), triple(permAutomatedTriage, odrl_assignee, clinicalAIService), triple(permAutomatedTriage, odrl_action, hl7ca_use), triple(permAutomatedTriage, odrl_target, healthRecordData), triple(permAutomatedTriage, odrl_constraint, cTriagePurpose), triple(cTriagePurpose, odrl_leftOperand, odrl_purpose), triple(cTriagePurpose, odrl_rightOperandReference, purposeCC), triple(permAutomatedTriage, odrl_duty, dutyHumanReview), triple(dutyHumanReview, odrl_action, humanReview), triple(dutyHumanReview, odrl_constraint, cTriageEncryption), triple(cTriageEncryption, odrl_leftOperand, encryptionAtRest), triple(cTriageEncryption, odrl_rightOperand, true), triple(permAutomatedTriage, clause, clauseH3), triple(permRetention10y, rdf_type, odrl_Permission), triple(permRetention10y, odrl_assigner, hospital), triple(permRetention10y, odrl_assignee, hospital), triple(permRetention10y, odrl_action, hl7ca_collect), triple(permRetention10y, odrl_target, healthRecordData), triple(permRetention10y, odrl_constraint, cRetentionPurpose), triple(cRetentionPurpose, odrl_leftOperand, odrl_purpose), triple(cRetentionPurpose, odrl_rightOperandReference, purposeCC), triple(permRetention10y, odrl_constraint, cRetentionDays), triple(cRetentionDays, odrl_leftOperand, retentionDays), triple(cRetentionDays, odrl_rightOperand, 3650), triple(permRetention10y, clause, clauseH4))).
triple(mitigateConsent, suggestAddGraph, (triple(permResearchUse, odrl_constraint, cExplicitConsent), triple(cExplicitConsent, odrl_leftOperand, explicitConsent), triple(cExplicitConsent, odrl_rightOperand, true))).
triple(mitigateDeId, suggestAddGraph, (triple(permShareWithPharma, odrl_constraint, cDeIdentified), triple(cDeIdentified, odrl_leftOperand, deIdentified), triple(cDeIdentified, odrl_rightOperand, true), triple(permShareWithPharma, odrl_duty, dutyDeIdentify), triple(dutyDeIdentify, odrl_action, deIdentify))).
triple(mitigateRetention, suggestAddGraph, (triple(permRetention10y, odrl_constraint, cRetentionLimit), triple(cRetentionLimit, odrl_leftOperand, retentionDays), triple(cRetentionLimit, odrl_rightOperand, 1095))).
triple(policyGraphHC1, contains, triple(cResearchPurpose, odrl_leftOperand, odrl_purpose)).
triple(policyGraphHC1, contains, triple(cResearchPurpose, odrl_rightOperandReference, purposeHMB)).
triple(policyGraphHC1, contains, triple(cRetentionDays, odrl_leftOperand, retentionDays)).
triple(policyGraphHC1, contains, triple(cRetentionDays, odrl_rightOperand, 3650)).
triple(policyGraphHC1, contains, triple(cRetentionPurpose, odrl_leftOperand, odrl_purpose)).
triple(policyGraphHC1, contains, triple(cRetentionPurpose, odrl_rightOperandReference, purposeCC)).
triple(policyGraphHC1, contains, triple(cSharePurpose, odrl_leftOperand, odrl_purpose)).
triple(policyGraphHC1, contains, triple(cSharePurpose, odrl_rightOperandReference, purposeHMB)).
triple(policyGraphHC1, contains, triple(cTriageEncryption, odrl_leftOperand, encryptionAtRest)).
triple(policyGraphHC1, contains, triple(cTriageEncryption, odrl_rightOperand, true)).
triple(policyGraphHC1, contains, triple(cTriagePurpose, odrl_leftOperand, odrl_purpose)).
triple(policyGraphHC1, contains, triple(cTriagePurpose, odrl_rightOperandReference, purposeCC)).
triple(policyGraphHC1, contains, triple(dutyHumanReview, odrl_action, humanReview)).
triple(policyGraphHC1, contains, triple(dutyHumanReview, odrl_constraint, cTriageEncryption)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, clause, clauseH3)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_action, hl7ca_use)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_assignee, clinicalAIService)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_assigner, hospital)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_constraint, cTriagePurpose)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_duty, dutyHumanReview)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, odrl_target, healthRecordData)).
triple(policyGraphHC1, contains, triple(permAutomatedTriage, rdf_type, odrl_Permission)).
triple(policyGraphHC1, contains, triple(permResearchUse, clause, clauseH1)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_action, hl7ca_use)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_assignee, researchUnit)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_assigner, hospital)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_constraint, cResearchPurpose)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_target, genomicData)).
triple(policyGraphHC1, contains, triple(permResearchUse, odrl_target, healthRecordData)).
triple(policyGraphHC1, contains, triple(permResearchUse, rdf_type, odrl_Permission)).
triple(policyGraphHC1, contains, triple(permRetention10y, clause, clauseH4)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_action, hl7ca_collect)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_assignee, hospital)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_assigner, hospital)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_constraint, cRetentionDays)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_constraint, cRetentionPurpose)).
triple(policyGraphHC1, contains, triple(permRetention10y, odrl_target, healthRecordData)).
triple(policyGraphHC1, contains, triple(permRetention10y, rdf_type, odrl_Permission)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, clause, clauseH2)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, odrl_action, hl7ca_disclose)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, odrl_assignee, pharmaPartner)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, odrl_assigner, hospital)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, odrl_constraint, cSharePurpose)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, odrl_target, genomicData)).
triple(policyGraphHC1, contains, triple(permShareWithPharma, rdf_type, odrl_Permission)).
triple(policyGraphHC1, contains, triple(policyHC1, odrl_permission, permAutomatedTriage)).
triple(policyGraphHC1, contains, triple(policyHC1, odrl_permission, permResearchUse)).
triple(policyGraphHC1, contains, triple(policyHC1, odrl_permission, permRetention10y)).
triple(policyGraphHC1, contains, triple(policyHC1, odrl_permission, permShareWithPharma)).
triple(policyGraphHC1, contains, triple(policyHC1, rdf_type, odrl_Policy)).
triple(processContextHC1, dpv_hasRisk, riskH1).
triple(processContextHC1, dpv_hasRisk, riskH2).
triple(processContextHC1, dpv_hasRisk, riskH4).
triple(report, firstRisk, riskH1).
triple(report, retentionRiskScore, 70).
triple(riskH1, aboutClause, clauseH1).
triple(riskH1, dct_description, "Risk: health/genomic data may be used for research without explicit opt-in consent.").
triple(riskH1, dct_source, permResearchUse).
triple(riskH1, dpv_hasRiskLevel, risk_HighRisk).
triple(riskH1, dpv_hasSeverity, risk_HighSeverity).
triple(riskH1, dpv_isMitigatedByMeasure, mitigateConsent).
triple(riskH1, rdf_type, dpv_Risk).
triple(riskH1, reportKey, 900).
triple(riskH1, score, 100).
triple(riskH1, scoreRaw, 120).
triple(riskH1, violatesNeed, need_ConsentForResearch).
triple(riskH2, aboutClause, clauseH2).
triple(riskH2, dct_description, "Risk: genomic data may be shared with external pharma partners without a de-identification/pseudonymisation requirement.").
triple(riskH2, dct_source, permShareWithPharma).
triple(riskH2, dpv_hasRiskLevel, risk_HighRisk).
triple(riskH2, dpv_hasSeverity, risk_HighSeverity).
triple(riskH2, dpv_isMitigatedByMeasure, mitigateDeId).
triple(riskH2, rdf_type, dpv_Risk).
triple(riskH2, reportKey, 900).
triple(riskH2, score, 100).
triple(riskH2, scoreRaw, 125).
triple(riskH2, violatesNeed, need_DeIdentifyBeforeSharing).
triple(riskH4, aboutClause, clauseH4).
triple(riskH4, dct_description, "Risk: retention (3650 days) exceeds patient preference (1095 days).").
triple(riskH4, dct_source, permRetention10y).
triple(riskH4, dpv_hasRiskLevel, risk_ModerateRisk).
triple(riskH4, dpv_hasSeverity, risk_ModerateSeverity).
triple(riskH4, dpv_isMitigatedByMeasure, mitigateRetention).
triple(riskH4, rdf_type, dpv_Risk).
triple(riskH4, reportKey, 930).
triple(riskH4, score, 70).
triple(riskH4, scoreRaw, 70).
triple(riskH4, violatesNeed, need_RetentionLimit3y).
