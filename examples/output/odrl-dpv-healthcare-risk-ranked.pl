triple(:AgreementHC1, :policyGraph, graph([statement(:PolicyHC1, rdf:type, odrl:Policy), statement(:PolicyHC1, odrl:permission, :PermResearchUse), statement(:PolicyHC1, odrl:permission, :PermShareWithPharma), statement(:PolicyHC1, odrl:permission, :PermAutomatedTriage), statement(:PolicyHC1, odrl:permission, :PermRetention10y), statement(:PermResearchUse, rdf:type, odrl:Permission), statement(:PermResearchUse, odrl:assigner, :Hospital), statement(:PermResearchUse, odrl:assignee, :ResearchUnit), statement(:PermResearchUse, odrl:action, hl7ca:use), statement(:PermResearchUse, odrl:target, :HealthRecordData), statement(:PermResearchUse, odrl:target, :GenomicData), statement(:PermResearchUse, odrl:constraint, :CResearchPurpose), statement(:CResearchPurpose, odrl:leftOperand, odrl:purpose), statement(:CResearchPurpose, odrl:rightOperandReference, :PurposeHMB), statement(:PermResearchUse, :clause, :ClauseH1), statement(:PermShareWithPharma, rdf:type, odrl:Permission), statement(:PermShareWithPharma, odrl:assigner, :Hospital), statement(:PermShareWithPharma, odrl:assignee, :PharmaPartner), statement(:PermShareWithPharma, odrl:action, hl7ca:disclose), statement(:PermShareWithPharma, odrl:target, :GenomicData), statement(:PermShareWithPharma, odrl:constraint, :CSharePurpose), statement(:CSharePurpose, odrl:leftOperand, odrl:purpose), statement(:CSharePurpose, odrl:rightOperandReference, :PurposeHMB), statement(:PermShareWithPharma, :clause, :ClauseH2), statement(:PermAutomatedTriage, rdf:type, odrl:Permission), statement(:PermAutomatedTriage, odrl:assigner, :Hospital), statement(:PermAutomatedTriage, odrl:assignee, :ClinicalAIService), statement(:PermAutomatedTriage, odrl:action, hl7ca:use), statement(:PermAutomatedTriage, odrl:target, :HealthRecordData), statement(:PermAutomatedTriage, odrl:constraint, :CTriagePurpose), statement(:CTriagePurpose, odrl:leftOperand, odrl:purpose), statement(:CTriagePurpose, odrl:rightOperandReference, :PurposeCC), statement(:PermAutomatedTriage, odrl:duty, :DutyHumanReview), statement(:DutyHumanReview, odrl:action, :humanReview), statement(:DutyHumanReview, odrl:constraint, :CTriageEncryption), statement(:CTriageEncryption, odrl:leftOperand, :encryptionAtRest), statement(:CTriageEncryption, odrl:rightOperand, true), statement(:PermAutomatedTriage, :clause, :ClauseH3), statement(:PermRetention10y, rdf:type, odrl:Permission), statement(:PermRetention10y, odrl:assigner, :Hospital), statement(:PermRetention10y, odrl:assignee, :Hospital), statement(:PermRetention10y, odrl:action, hl7ca:collect), statement(:PermRetention10y, odrl:target, :HealthRecordData), statement(:PermRetention10y, odrl:constraint, :CRetentionPurpose), statement(:CRetentionPurpose, odrl:leftOperand, odrl:purpose), statement(:CRetentionPurpose, odrl:rightOperandReference, :PurposeCC), statement(:PermRetention10y, odrl:constraint, :CRetentionDays), statement(:CRetentionDays, odrl:leftOperand, :retentionDays), statement(:CRetentionDays, odrl:rightOperand, 3650), statement(:PermRetention10y, :clause, :ClauseH4)])).
triple(:MitigateConsent, :suggestAddGraph, graph([statement(:PermResearchUse, odrl:constraint, :CExplicitConsent), statement(:CExplicitConsent, odrl:leftOperand, :explicitConsent), statement(:CExplicitConsent, odrl:rightOperand, true)])).
triple(:MitigateDeId, :suggestAddGraph, graph([statement(:PermShareWithPharma, odrl:constraint, :CDeIdentified), statement(:CDeIdentified, odrl:leftOperand, :deIdentified), statement(:CDeIdentified, odrl:rightOperand, true), statement(:PermShareWithPharma, odrl:duty, :DutyDeIdentify), statement(:DutyDeIdentify, odrl:action, :deIdentify)])).
triple(:MitigateRetention, :suggestAddGraph, graph([statement(:PermRetention10y, odrl:constraint, :CRetentionLimit), statement(:CRetentionLimit, odrl:leftOperand, :retentionDays), statement(:CRetentionLimit, odrl:rightOperand, 1095)])).
triple(:PolicyGraphHC1, :contains, statement(:CResearchPurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, statement(:CResearchPurpose, odrl:rightOperandReference, :PurposeHMB)).
triple(:PolicyGraphHC1, :contains, statement(:CRetentionDays, odrl:leftOperand, :retentionDays)).
triple(:PolicyGraphHC1, :contains, statement(:CRetentionDays, odrl:rightOperand, 3650)).
triple(:PolicyGraphHC1, :contains, statement(:CRetentionPurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, statement(:CRetentionPurpose, odrl:rightOperandReference, :PurposeCC)).
triple(:PolicyGraphHC1, :contains, statement(:CSharePurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, statement(:CSharePurpose, odrl:rightOperandReference, :PurposeHMB)).
triple(:PolicyGraphHC1, :contains, statement(:CTriageEncryption, odrl:leftOperand, :encryptionAtRest)).
triple(:PolicyGraphHC1, :contains, statement(:CTriageEncryption, odrl:rightOperand, true)).
triple(:PolicyGraphHC1, :contains, statement(:CTriagePurpose, odrl:leftOperand, odrl:purpose)).
triple(:PolicyGraphHC1, :contains, statement(:CTriagePurpose, odrl:rightOperandReference, :PurposeCC)).
triple(:PolicyGraphHC1, :contains, statement(:DutyHumanReview, odrl:action, :humanReview)).
triple(:PolicyGraphHC1, :contains, statement(:DutyHumanReview, odrl:constraint, :CTriageEncryption)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, :clause, :ClauseH3)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:action, hl7ca:use)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:assignee, :ClinicalAIService)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:constraint, :CTriagePurpose)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:duty, :DutyHumanReview)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, statement(:PermAutomatedTriage, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, :clause, :ClauseH1)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:action, hl7ca:use)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:assignee, :ResearchUnit)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:constraint, :CResearchPurpose)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:target, :GenomicData)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, statement(:PermResearchUse, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, :clause, :ClauseH4)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:action, hl7ca:collect)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:assignee, :Hospital)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:constraint, :CRetentionDays)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:constraint, :CRetentionPurpose)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, odrl:target, :HealthRecordData)).
triple(:PolicyGraphHC1, :contains, statement(:PermRetention10y, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, :clause, :ClauseH2)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, odrl:action, hl7ca:disclose)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, odrl:assignee, :PharmaPartner)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, odrl:assigner, :Hospital)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, odrl:constraint, :CSharePurpose)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, odrl:target, :GenomicData)).
triple(:PolicyGraphHC1, :contains, statement(:PermShareWithPharma, rdf:type, odrl:Permission)).
triple(:PolicyGraphHC1, :contains, statement(:PolicyHC1, odrl:permission, :PermAutomatedTriage)).
triple(:PolicyGraphHC1, :contains, statement(:PolicyHC1, odrl:permission, :PermResearchUse)).
triple(:PolicyGraphHC1, :contains, statement(:PolicyHC1, odrl:permission, :PermRetention10y)).
triple(:PolicyGraphHC1, :contains, statement(:PolicyHC1, odrl:permission, :PermShareWithPharma)).
triple(:PolicyGraphHC1, :contains, statement(:PolicyHC1, rdf:type, odrl:Policy)).
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
