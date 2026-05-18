% Delfour insight-economy case adapted from Eyeling delfour.n3.
% The original N3 emits a Markdown answer with log:outputString.  This Eyelog
% translation derives the same authorization, shopping banner, alternative, and
% checklist facts as triple/3 materialization.

case_name(:case, "delfour").
request_purpose(:case, "shopping_assist").
request_action(:case, odrl:use).
phone_created_at(:case, "2025-10-05T20:33:48.907163+00:00").
phone_expires_at(:case, "2025-10-05T22:33:48.907185+00:00").
scanner_auth_at(:case, "2025-10-05T20:35:48.907163+00:00").
scanner_duty_at(:case, "2025-10-05T20:37:48.907163+00:00").
files_written(:case, 6).
audit_entries(:case, 1).

product(:prod_BIS_001).
product(:prod_BIS_101).
product(:prod_CHOC_050).
product(:prod_CHOC_150).

product_id(:prod_BIS_001, "prod:BIS_001").
product_name(:prod_BIS_001, "Classic Tea Biscuits").
sugar_tenths(:prod_BIS_001, 120).
sugar_per_serving(:prod_BIS_001, 12.0).

product_id(:prod_BIS_101, "prod:BIS_101").
product_name(:prod_BIS_101, "Low-Sugar Tea Biscuits").
sugar_tenths(:prod_BIS_101, 30).
sugar_per_serving(:prod_BIS_101, 3.0).

product_id(:prod_CHOC_050, "prod:CHOC_050").
product_name(:prod_CHOC_050, "Milk Chocolate Bar").
sugar_tenths(:prod_CHOC_050, 150).
sugar_per_serving(:prod_CHOC_050, 15.0).

product_id(:prod_CHOC_150, "prod:CHOC_150").
product_name(:prod_CHOC_150, "85% Dark Chocolate").
sugar_tenths(:prod_CHOC_150, 60).
sugar_per_serving(:prod_CHOC_150, 6.0).

condition(:householdProfile, "Diabetes").
scanned_product(:scan, :prod_BIS_001).

insight(:insight).
metric(:insight, "sugar_g_per_serving").
threshold_tenths(:insight, 100).
threshold_display(:insight, "10.0").
threshold_g(:insight, 10.0).
suggestion_policy(:insight, "lower_metric_first_higher_price_ok").
scope_device(:insight, "self-scanner").
scope_event(:insight, "pick_up_scanner").
retailer(:insight, "Delfour").
created_at(:insight, "2025-10-05T20:33:48.907163+00:00").
expires_at(:insight, "2025-10-05T22:33:48.907185+00:00").
serialized_lowercase(:insight, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner").

policy(:policy).
permission(:policy, odrl:use, :insight, "shopping_assist").
prohibition(:policy, odrl:distribute, :insight, "marketing").
duty(:policy, odrl:delete, "2025-10-05T22:33:48.907185+00:00").

envelope_insight(:envelope, :insight).
envelope_policy(:envelope, :policy).
envelope_hash(:envelope, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098").
signature_alg(:signature, "HMAC-SHA256").
signature_keyid(:signature, "demo-shared-secret").
signature_created(:signature, "2025-10-05T20:33:48.907163+00:00").
payload_hash_sha256(:signature, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098").
signature_hmac(:signature, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2").
hmac_verification_mode(:signature, :trustedPrecomputedInput).
reason_text(:reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.").

needs_low_sugar(:case) :-
  condition(:householdProfile, "Diabetes").

derived_from_need(:insight, "low_sugar") :-
  needs_low_sugar(:case).

payload_hash_matches(:check) :-
  envelope_hash(:envelope, Digest),
  payload_hash_sha256(:signature, Digest).

signature_verifies(:check) :-
  hmac_verification_mode(:signature, :trustedPrecomputedInput).

minimization_strips_sensitive_terms(:check) :-
  serialized_lowercase(:insight, Text),
  string:notMatches(Text, "diabetes|medical").

scope_complete(:check) :-
  scope_device(:insight, _Device),
  scope_event(:insight, _Event),
  expires_at(:insight, _Expiry).

authorization_allowed(:check) :-
  permission(:policy, odrl:use, :insight, "shopping_assist"),
  request_purpose(:case, "shopping_assist"),
  scanner_auth_at(:case, AuthAt),
  expires_at(:insight, ExpiresAt),
  math:notGreaterThan(AuthAt, ExpiresAt).

decision(:decision, "Allowed", :insight) :-
  authorization_allowed(:check).

banner_flags_high_sugar(:check) :-
  decision(:decision, "Allowed", :insight),
  scanned_product(:scan, Product),
  sugar_per_serving(Product, Sugar),
  threshold_g(:insight, Threshold),
  math:notLessThan(Sugar, Threshold).

banner_headline(:banner, "Track sugar per serving while you scan") :-
  banner_flags_high_sugar(:check).

banner_note(:banner, "High sugar") :-
  banner_flags_high_sugar(:check).

better_lower_sugar(ScannedSugar, CandidateSugar) :-
  product(Other),
  sugar_tenths(Other, OtherSugar),
  math:greaterThan(ScannedSugar, OtherSugar),
  math:lessThan(OtherSugar, CandidateSugar).

suggested_alternative(:case, Candidate) :-
  scanned_product(:scan, Scanned),
  sugar_tenths(Scanned, ScannedSugar),
  product(Candidate),
  sugar_tenths(Candidate, CandidateSugar),
  math:greaterThan(ScannedSugar, CandidateSugar),
  not(better_lower_sugar(ScannedSugar, CandidateSugar)).

banner_suggested_alternative(:banner, Name) :-
  banner_note(:banner, "High sugar"),
  suggested_alternative(:case, Alternative),
  product_name(Alternative, Name).

alternative_is_lower_sugar(:check) :-
  scanned_product(:scan, Scanned),
  sugar_tenths(Scanned, ScannedSugar),
  suggested_alternative(:case, Alternative),
  sugar_tenths(Alternative, AlternativeSugar),
  math:greaterThan(ScannedSugar, AlternativeSugar).

duty_timing_consistent(:check) :-
  scanner_duty_at(:case, DutyAt),
  expires_at(:insight, ExpiresAt),
  math:notGreaterThan(DutyAt, ExpiresAt).

marketing_prohibited(:check) :-
  prohibition(:policy, odrl:distribute, :insight, "marketing").

files_written_expected(:check) :-
  files_written(:case, 6).

all_checks_pass(:result) :-
  signature_verifies(:check),
  payload_hash_matches(:check),
  minimization_strips_sensitive_terms(:check),
  scope_complete(:check),
  authorization_allowed(:check),
  banner_flags_high_sugar(:check),
  alternative_is_lower_sugar(:check),
  duty_timing_consistent(:check),
  marketing_prohibited(:check),
  files_written_expected(:check).

triple(:case, :caseName, Name) :- case_name(:case, Name).
triple(:case, :needsLowSugar, true) :- needs_low_sugar(:case).
triple(:insight, :derivedFromNeed, Need) :- derived_from_need(:insight, Need).
triple(:decision, :outcome, Outcome) :- decision(:decision, Outcome, _Target).
triple(:decision, :target, Target) :- decision(:decision, _Outcome, Target).
triple(:scan, :scannedProduct, ProductName) :- scanned_product(:scan, Product), product_name(Product, ProductName).
triple(:case, :suggestedAlternative, Alternative) :- suggested_alternative(:case, Alternative).
triple(:banner, :headline, Headline) :- banner_headline(:banner, Headline).
triple(:banner, :note, Note) :- banner_note(:banner, Note).
triple(:banner, :suggestedAlternative, Name) :- banner_suggested_alternative(:banner, Name).
triple(:reasonText, :value, Text) :- reason_text(:reasonText, Text).
triple(:signature, :alg, Alg) :- signature_alg(:signature, Alg).
triple(:case, :auditEntries, Count) :- audit_entries(:case, Count).
triple(:case, :filesWritten, Count) :- files_written(:case, Count).
triple(:result, :allChecksPass, true) :- all_checks_pass(:result).
triple(:check, :signatureVerifies, true) :- signature_verifies(:check).
triple(:check, :payloadHashMatches, true) :- payload_hash_matches(:check).
triple(:check, :minimizationStripsSensitiveTerms, true) :- minimization_strips_sensitive_terms(:check).
triple(:check, :scopeComplete, true) :- scope_complete(:check).
triple(:check, :authorizationAllowed, true) :- authorization_allowed(:check).
triple(:check, :bannerFlagsHighSugar, true) :- banner_flags_high_sugar(:check).
triple(:check, :alternativeIsLowerSugar, true) :- alternative_is_lower_sugar(:check).
triple(:check, :dutyTimingConsistent, true) :- duty_timing_consistent(:check).
triple(:check, :marketingProhibited, true) :- marketing_prohibited(:check).
triple(:check, :filesWrittenExpected, true) :- files_written_expected(:check).
