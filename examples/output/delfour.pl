caseName(case, "delfour").
needsLowSugar(case, true).
derivedFromNeed(insight, "low_sugar").
outcome(decision, "Allowed").
target(decision, insight).
scannedProduct(scan, "Classic Tea Biscuits").
suggestedAlternative(case, prod_BIS_101).
suggestedAlternative(banner, "Low-Sugar Tea Biscuits").
headline(banner, "Track sugar per serving while you scan").
note(banner, "High sugar").
value(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.").
alg(signature, "HMAC-SHA256").
auditEntries(case, 1).
filesWritten(case, 6).
allChecksPass(result, true).
signatureVerifies(check, true).
payloadHashMatches(check, true).
minimizationStripsSensitiveTerms(check, true).
scopeComplete(check, true).
authorizationAllowed(check, true).
bannerFlagsHighSugar(check, true).
alternativeIsLowerSugar(check, true).
dutyTimingConsistent(check, true).
marketingProhibited(check, true).
filesWrittenExpected(check, true).
