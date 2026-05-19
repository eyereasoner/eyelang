triple(:AgreementHC1, :policyGraph, (triple(:PolicyHC1, rdf:type, odrl:Policy), triple(:PolicyHC1, odrl:permission, :PermResearchUse), triple(:PolicyHC1, odrl:permission, :PermShareWithPharma), triple(:PolicyHC1, odrl:permission, :PermAutomatedTriage), triple(:PolicyHC1, odrl:permission, :PermRetention10y), triple(:PermResearchUse, rdf:type, odrl:Permission), triple(:PermResearchUse, odrl:assigner, :Hospital), triple(:PermResearchUse, odrl:assignee, :ResearchUnit), triple(:PermResearchUse, odrl:action, hl7ca:use), triple(:PermResearchUse, odrl:target, :HealthRecordData), triple(:PermResearchUse, odrl:target, :GenomicData), triple(:PermResearchUse, odrl:constraint, :CResearchPurpose), triple(:CResearchPurpose, odrl:leftOperand, odrl:purpose), triple(:CResearchPurpose, odrl:rightOperandReference, :PurposeHMB), triple(:PermResearchUse, :clause, :ClauseH1), triple(:PermShareWithPharma, rdf:type, odrl:Permission), triple(:PermShareWithPharma, odrl:assigner, :Hospital), triple(:PermShareWithPharma, odrl:assignee, :PharmaPartner), triple(:PermShareWithPharma, odrl:action, hl7ca:disclose), triple(:PermShareWithPharma, odrl:target, :GenomicData), triple(:PermShareWithPharma, odrl:constraint, :CSharePurpose), triple(:CSharePurpose, odrl:leftOperand, odrl:purpose), triple(:CSharePurpose, odrl:rightOperandReference, :PurposeHMB), triple(:PermShareWithPharma, :clause, :ClauseH2), triple(:PermAutomatedTriage, rdf:type, odrl:Permission), triple(:PermAutomatedTriage, odrl:assigner, :Hospital), triple(:PermAutomatedTriage, odrl:assignee, :ClinicalAIService), triple(:PermAutomatedTriage, odrl:action, hl7ca:use), triple(:PermAutomatedTriage, odrl:target, :HealthRecordData), triple(:PermAutomatedTriage, odrl:constraint, :CTriagePurpose), triple(:CTriagePurpose, odrl:leftOperand, odrl:purpose), triple(:CTriagePurpose, odrl:rightOperandReference, :PurposeCC), triple(:PermAutomatedTriage, odrl:duty, :DutyHumanReview), triple(:DutyHumanReview, odrl:action, :humanReview), triple(:DutyHumanReview, odrl:constraint, :CTriageEncryption), triple(:CTriageEncryption, odrl:leftOperand, :encryptionAtRest), triple(:CTriageEncryption, odrl:rightOperand, true), triple(:PermAutomatedTriage, :clause, :ClauseH3), triple(:PermRetention10y, rdf:type, odrl:Permission), triple(:PermRetention10y, odrl:assigner, :Hospital), triple(:PermRetention10y, odrl:assignee, :Hospital), triple(:PermRetention10y, odrl:action, hl7ca:collect), triple(:PermRetention10y, odrl:target, :HealthRecordData), triple(:PermRetention10y, odrl:constraint, :CRetentionPurpose), triple(:CRetentionPurpose, odrl:leftOperand, odrl:purpose), triple(:CRetentionPurpose, odrl:rightOperandReference, :PurposeCC), triple(:PermRetention10y, odrl:constraint, :CRetentionDays), triple(:CRetentionDays, odrl:leftOperand, :retentionDays), triple(:CRetentionDays, odrl:rightOperand, 3650), triple(:PermRetention10y, :clause, :ClauseH4))).
triple(:MitigateConsent, :suggestAddGraph, (triple(:PermResearchUse, odrl:constraint, :CExplicitConsent), triple(:CExplicitConsent, odrl:leftOperand, :explicitConsent), triple(:CExplicitConsent, odrl:rightOperand, true))).
triple(:MitigateDeId, :suggestAddGraph, (triple(:PermShareWithPharma, odrl:constraint, :CDeIdentified), triple(:CDeIdentified, odrl:leftOperand, :deIdentified), triple(:CDeIdentified, odrl:rightOperand, true), triple(:PermShareWithPharma, odrl:duty, :DutyDeIdentify), triple(:DutyDeIdentify, odrl:action, :deIdentify))).
triple(:MitigateRetention, :suggestAddGraph, (triple(:PermRetention10y, odrl:constraint, :CRetentionLimit), triple(:CRetentionLimit, odrl:leftOperand, :retentionDays), triple(:CRetentionLimit, odrl:rightOperand, 1095))).
triple(:PolicyGraphHC1, :contains, triple(:CResearchPurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, triple(:CResearchPurpose, odrl:rightOperandReference, :PurposeHMB)).
triple(:PolicyGraphHC1, :contains, triple(:CRetentionDays, odrl:leftOperand, :retentionDays)).
triple(:PolicyGraphHC1, :contains, triple(:CRetentionDays, odrl:rightOperand, 3650)).
triple(:PolicyGraphHC1, :contains, triple(:CRetentionPurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, triple(:CRetentionPurpose, odrl:rightOperandReference, :PurposeCC)).
triple(:PolicyGraphHC1, :contains, triple(:CSharePurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, triple(:CSharePurpose, odrl:rightOperandReference, :PurposeHMB)).
triple(:PolicyGraphHC1, :contains, triple(:CTriageEncryption, odrl:leftOperand, :encryptionAtRest)).
triple(:PolicyGraphHC1, :contains, triple(:CTriageEncryption, odrl:rightOperand, true)).
triple(:PolicyGraphHC1, :contains, triple(:CTriagePurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, triple(:CTriagePurpose, odrl:rightOperandReference, :PurposeCC)).
triple(:PolicyGraphHC1, :contains, triple(:DutyHumanReview, odrl:action, :humanReview)).
triple(:PolicyGraphHC1, :contains, triple(:DutyHumanReview, odrl:constraint, :CTriageEncryption)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, :clause, :ClauseH3)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:action, hl7ca:use)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:assignee, :ClinicalAIService)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:constraint, :CTriagePurpose)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:duty, :DutyHumanReview)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, triple(:PermAutomatedTriage, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, :clause, :ClauseH1)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:action, hl7ca:use)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:assignee, :ResearchUnit)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:constraint, :CResearchPurpose)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:target, :GenomicData)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, triple(:PermResearchUse, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, :clause, :ClauseH4)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:action, hl7ca:collect)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:assignee, :Hospital)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:constraint, :CRetentionDays)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:constraint, :CRetentionPurpose)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, triple(:PermRetention10y, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, :clause, :ClauseH2)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, odrl:action, hl7ca:disclose)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, odrl:assignee, :PharmaPartner)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, odrl:constraint, :CSharePurpose)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, odrl:target, :GenomicData)).
triple(:PolicyGraphHC1, :contains, triple(:PermShareWithPharma, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, triple(:PolicyHC1, odrl:permission, :PermAutomatedTriage)).
triple(:PolicyGraphHC1, :contains, triple(:PolicyHC1, odrl:permission, :PermResearchUse)).
triple(:PolicyGraphHC1, :contains, triple(:PolicyHC1, odrl:permission, :PermRetention10y)).
triple(:PolicyGraphHC1, :contains, triple(:PolicyHC1, odrl:permission, :PermShareWithPharma)).
triple(:PolicyGraphHC1, :contains, triple(:PolicyHC1, rdf:type, odrl:Policy)).
triple(:ProcessContextHC1, dpv:hasRisk, :riskH1).
triple(:ProcessContextHC1, dpv:hasRisk, :riskH2).
triple(:ProcessContextHC1, dpv:hasRisk, :riskH4).
triple(:report, :firstRisk, :riskH1).
triple(:report, :retentionRiskScore, 70).
triple(:riskH1, :aboutClause, :ClauseH1).
triple(:riskH1, :reportKey, 900).
triple(:riskH1, :score, 100).
triple(:riskH1, :scoreRaw, 120).
triple(:riskH1, :violatesNeed, :Need_ConsentForResearch).
triple(:riskH1, dct:description, "Risk: health/genomic data may be used for research without explicit opt-in consent.").
triple(:riskH1, dct:source, :PermResearchUse).
triple(:riskH1, dpv:hasRiskLevel, risk:HighRisk).
triple(:riskH1, dpv:hasSeverity, risk:HighSeverity).
triple(:riskH1, dpv:isMitigatedByMeasure, :MitigateConsent).
triple(:riskH1, rdf:type, dpv:Risk).
triple(:riskH2, :aboutClause, :ClauseH2).
triple(:riskH2, :reportKey, 900).
triple(:riskH2, :score, 100).
triple(:riskH2, :scoreRaw, 125).
triple(:riskH2, :violatesNeed, :Need_DeIdentifyBeforeSharing).
triple(:riskH2, dct:description, "Risk: genomic data may be shared with external pharma partners without a de-identification/pseudonymisation requirement.").
triple(:riskH2, dct:source, :PermShareWithPharma).
triple(:riskH2, dpv:hasRiskLevel, risk:HighRisk).
triple(:riskH2, dpv:hasSeverity, risk:HighSeverity).
triple(:riskH2, dpv:isMitigatedByMeasure, :MitigateDeId).
triple(:riskH2, rdf:type, dpv:Risk).
triple(:riskH4, :aboutClause, :ClauseH4).
triple(:riskH4, :reportKey, 930).
triple(:riskH4, :score, 70).
triple(:riskH4, :scoreRaw, 70).
triple(:riskH4, :violatesNeed, :Need_RetentionLimit3y).
triple(:riskH4, dct:description, "Risk: retention (3650 days) exceeds patient preference (1095 days).").
triple(:riskH4, dct:source, :PermRetention10y).
triple(:riskH4, dpv:hasRiskLevel, risk:ModerateRisk).
triple(:riskH4, dpv:hasSeverity, risk:ModerateSeverity).
triple(:riskH4, dpv:isMitigatedByMeasure, :MitigateRetention).
triple(:riskH4, rdf:type, dpv:Risk).
