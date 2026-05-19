triple(banner, headline, "Track sugar per serving while you scan").
triple(banner, note, "High sugar").
triple(banner, suggestedAlternative, "Low-Sugar Tea Biscuits").
triple(case, auditEntries, 1).
triple(case, caseName, "delfour").
triple(case, filesWritten, 6).
triple(case, needsLowSugar, true).
triple(case, suggestedAlternative, prod_BIS_101).
triple(check, alternativeIsLowerSugar, true).
triple(check, authorizationAllowed, true).
triple(check, bannerFlagsHighSugar, true).
triple(check, dutyTimingConsistent, true).
triple(check, filesWrittenExpected, true).
triple(check, marketingProhibited, true).
triple(check, minimizationStripsSensitiveTerms, true).
triple(check, payloadHashMatches, true).
triple(check, scopeComplete, true).
triple(check, signatureVerifies, true).
triple(decision, outcome, "Allowed").
triple(decision, target, insight).
triple(insight, derivedFromNeed, "low_sugar").
triple(reasonText, value, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.").
triple(result, allChecksPass, true).
triple(scan, scannedProduct, "Classic Tea Biscuits").
triple(signature, alg, "HMAC-SHA256").
