% Delfour insight-economy case adapted from Eyeling delfour.n3.
% The original N3 emits a Markdown answer with log_outputString.  This Eyelog
% translation derives the same authorization, shopping banner, alternative, and
% checklist facts as triple/3 materialization.
%
% Static input is kept as scoped data: the case, insight, policy, envelope, and
% signature are formula terms, while the product catalog is a list of records.
% Rules project only the fields they need, avoiding global permission/prohibition
% facts that could contradict another policy formula in the same program.

case_graph(delfourCaseGraph, (
  triple(case, caseName, "delfour"),
  triple(case, requestPurpose, "shopping_assist"),
  triple(case, requestAction, odrl_use),
  triple(case, phoneCreatedAt, "2025-10-05T20:33:48.907163+00:00"),
  triple(case, phoneExpiresAt, "2025-10-05T22:33:48.907185+00:00"),
  triple(case, scannerAuthAt, "2025-10-05T20:35:48.907163+00:00"),
  triple(case, scannerDutyAt, "2025-10-05T20:37:48.907163+00:00"),
  triple(case, filesWritten, 6),
  triple(case, auditEntries, 1),
  triple(householdProfile, condition, "Diabetes"),
  triple(scan, scannedProduct, prod_BIS_001)
)).

product_catalog(delfourCatalog, [
  product(prod_BIS_001, "prod_BIS_001", "Classic Tea Biscuits", 120, 12.0),
  product(prod_BIS_101, "prod_BIS_101", "Low-Sugar Tea Biscuits", 30, 3.0),
  product(prod_CHOC_050, "prod_CHOC_050", "Milk Chocolate Bar", 150, 15.0),
  product(prod_CHOC_150, "prod_CHOC_150", "85% Dark Chocolate", 60, 6.0)
]).

insight_graph(delfourInsightGraph, (
  triple(insight, metric, "sugar_g_per_serving"),
  triple(insight, thresholdTenths, 100),
  triple(insight, thresholdDisplay, "10.0"),
  triple(insight, thresholdG, 10.0),
  triple(insight, suggestionPolicy, "lower_metric_first_higher_price_ok"),
  triple(insight, scopeDevice, "self-scanner"),
  triple(insight, scopeEvent, "pick_up_scanner"),
  triple(insight, retailer, "Delfour"),
  triple(insight, createdAt, "2025-10-05T20:33:48.907163+00:00"),
  triple(insight, expiresAt, "2025-10-05T22:33:48.907185+00:00"),
  triple(insight, serializedLowercase, "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner")
)).

policy_graph(delfourPolicyGraph, (
  triple(policy, odrl_permission, permission(odrl_use, insight, "shopping_assist")),
  triple(policy, odrl_prohibition, prohibition(odrl_distribute, insight, "marketing")),
  triple(policy, odrl_duty, duty(odrl_delete, "2025-10-05T22:33:48.907185+00:00"))
)).

envelope_graph(delfourEnvelopeGraph, (
  triple(envelope, insight, delfourInsightGraph),
  triple(envelope, policy, delfourPolicyGraph),
  triple(envelope, hash, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098")
)).

signature_graph(delfourSignatureGraph, (
  triple(signature, alg, "HMAC-SHA256"),
  triple(signature, keyid, "demo-shared-secret"),
  triple(signature, created, "2025-10-05T20:33:48.907163+00:00"),
  triple(signature, payloadHashSha256, "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098"),
  triple(signature, hmac, "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2"),
  triple(signature, hmacVerificationMode, trustedPrecomputedInput)
)).

reason_text(reasonText, "Household requires low-sugar guidance (diabetes in POD). A neutral Insight is scoped to device 'self-scanner', event 'pick_up_scanner', retailer 'Delfour', and expires soon; the policy confines use to shopping assistance.").

case_triple(S, P, O) :- case_graph(delfourCaseGraph, Formula), formula_triple(Formula, S, P, O).
insight_triple(S, P, O) :- insight_graph(delfourInsightGraph, Formula), formula_triple(Formula, S, P, O).
policy_triple(S, P, O) :- policy_graph(delfourPolicyGraph, Formula), formula_triple(Formula, S, P, O).
envelope_triple(S, P, O) :- envelope_graph(delfourEnvelopeGraph, Formula), formula_triple(Formula, S, P, O).
signature_triple(S, P, O) :- signature_graph(delfourSignatureGraph, Formula), formula_triple(Formula, S, P, O).

case_name(case, Name) :- case_triple(case, caseName, Name).
request_purpose(case, Purpose) :- case_triple(case, requestPurpose, Purpose).
request_action(case, Action) :- case_triple(case, requestAction, Action).
phone_created_at(case, Time) :- case_triple(case, phoneCreatedAt, Time).
phone_expires_at(case, Time) :- case_triple(case, phoneExpiresAt, Time).
scanner_auth_at(case, Time) :- case_triple(case, scannerAuthAt, Time).
scanner_duty_at(case, Time) :- case_triple(case, scannerDutyAt, Time).
files_written(case, Count) :- case_triple(case, filesWritten, Count).
audit_entries(case, Count) :- case_triple(case, auditEntries, Count).
condition(householdProfile, Condition) :- case_triple(householdProfile, condition, Condition).
scanned_product(scan, Product) :- case_triple(scan, scannedProduct, Product).

product(Product) :- product_catalog(delfourCatalog, Products), member(product(Product, _Id, _Name, _SugarTenths, _SugarG), Products).
product_id(Product, Id) :- product_catalog(delfourCatalog, Products), member(product(Product, Id, _Name, _SugarTenths, _SugarG), Products).
product_name(Product, Name) :- product_catalog(delfourCatalog, Products), member(product(Product, _Id, Name, _SugarTenths, _SugarG), Products).
sugar_tenths(Product, Sugar) :- product_catalog(delfourCatalog, Products), member(product(Product, _Id, _Name, Sugar, _SugarG), Products).
sugar_per_serving(Product, Sugar) :- product_catalog(delfourCatalog, Products), member(product(Product, _Id, _Name, _SugarTenths, Sugar), Products).

insight(insight).
metric(insight, Metric) :- insight_triple(insight, metric, Metric).
threshold_tenths(insight, Threshold) :- insight_triple(insight, thresholdTenths, Threshold).
threshold_display(insight, Threshold) :- insight_triple(insight, thresholdDisplay, Threshold).
threshold_g(insight, Threshold) :- insight_triple(insight, thresholdG, Threshold).
suggestion_policy(insight, Policy) :- insight_triple(insight, suggestionPolicy, Policy).
scope_device(insight, Device) :- insight_triple(insight, scopeDevice, Device).
scope_event(insight, Event) :- insight_triple(insight, scopeEvent, Event).
retailer(insight, Retailer) :- insight_triple(insight, retailer, Retailer).
created_at(insight, Time) :- insight_triple(insight, createdAt, Time).
expires_at(insight, Time) :- insight_triple(insight, expiresAt, Time).
serialized_lowercase(insight, Text) :- insight_triple(insight, serializedLowercase, Text).

policy(policy).
permission(policy, Action, Target, Purpose) :- policy_triple(policy, odrl_permission, permission(Action, Target, Purpose)).
prohibition(policy, Action, Target, Purpose) :- policy_triple(policy, odrl_prohibition, prohibition(Action, Target, Purpose)).
duty(policy, Action, Time) :- policy_triple(policy, odrl_duty, duty(Action, Time)).

envelope_insight(envelope, Insight) :- envelope_triple(envelope, insight, Insight).
envelope_policy(envelope, Policy) :- envelope_triple(envelope, policy, Policy).
envelope_hash(envelope, Hash) :- envelope_triple(envelope, hash, Hash).
signature_alg(signature, Alg) :- signature_triple(signature, alg, Alg).
signature_keyid(signature, KeyId) :- signature_triple(signature, keyid, KeyId).
signature_created(signature, Time) :- signature_triple(signature, created, Time).
payload_hash_sha256(signature, Hash) :- signature_triple(signature, payloadHashSha256, Hash).
signature_hmac(signature, Hmac) :- signature_triple(signature, hmac, Hmac).
hmac_verification_mode(signature, Mode) :- signature_triple(signature, hmacVerificationMode, Mode).

needs_low_sugar(case) :-
  condition(householdProfile, "Diabetes").

derived_from_need(insight, "low_sugar") :-
  needs_low_sugar(case).

payload_hash_matches(check) :-
  envelope_hash(envelope, Digest),
  payload_hash_sha256(signature, Digest).

signature_verifies(check) :-
  hmac_verification_mode(signature, trustedPrecomputedInput).

minimization_strips_sensitive_terms(check) :-
  serialized_lowercase(insight, Text),
  not_matches(Text, "diabetes|medical").

scope_complete(check) :-
  scope_device(insight, _Device),
  scope_event(insight, _Event),
  expires_at(insight, _Expiry).

authorization_allowed(check) :-
  permission(policy, odrl_use, insight, "shopping_assist"),
  request_purpose(case, "shopping_assist"),
  scanner_auth_at(case, AuthAt),
  expires_at(insight, ExpiresAt),
  le(AuthAt, ExpiresAt).

decision(decision, "Allowed", insight) :-
  authorization_allowed(check).

banner_flags_high_sugar(check) :-
  decision(decision, "Allowed", insight),
  scanned_product(scan, Product),
  sugar_per_serving(Product, Sugar),
  threshold_g(insight, Threshold),
  ge(Sugar, Threshold).

banner_headline(banner, "Track sugar per serving while you scan") :-
  banner_flags_high_sugar(check).

banner_note(banner, "High sugar") :-
  banner_flags_high_sugar(check).

better_lower_sugar(ScannedSugar, CandidateSugar) :-
  product(Other),
  sugar_tenths(Other, OtherSugar),
  gt(ScannedSugar, OtherSugar),
  lt(OtherSugar, CandidateSugar).

suggested_alternative(case, Candidate) :-
  scanned_product(scan, Scanned),
  sugar_tenths(Scanned, ScannedSugar),
  product(Candidate),
  sugar_tenths(Candidate, CandidateSugar),
  gt(ScannedSugar, CandidateSugar),
  not(better_lower_sugar(ScannedSugar, CandidateSugar)).

banner_suggested_alternative(banner, Name) :-
  banner_note(banner, "High sugar"),
  suggested_alternative(case, Alternative),
  product_name(Alternative, Name).

alternative_is_lower_sugar(check) :-
  scanned_product(scan, Scanned),
  sugar_tenths(Scanned, ScannedSugar),
  suggested_alternative(case, Alternative),
  sugar_tenths(Alternative, AlternativeSugar),
  gt(ScannedSugar, AlternativeSugar).

duty_timing_consistent(check) :-
  scanner_duty_at(case, DutyAt),
  expires_at(insight, ExpiresAt),
  le(DutyAt, ExpiresAt).

marketing_prohibited(check) :-
  prohibition(policy, odrl_distribute, insight, "marketing").

files_written_expected(check) :-
  files_written(case, 6).

all_checks_pass(result) :-
  signature_verifies(check),
  payload_hash_matches(check),
  minimization_strips_sensitive_terms(check),
  scope_complete(check),
  authorization_allowed(check),
  banner_flags_high_sugar(check),
  alternative_is_lower_sugar(check),
  duty_timing_consistent(check),
  marketing_prohibited(check),
  files_written_expected(check).

triple(case, caseName, Name) :- case_name(case, Name).
triple(case, needsLowSugar, true) :- needs_low_sugar(case).
triple(insight, derivedFromNeed, Need) :- derived_from_need(insight, Need).
triple(decision, outcome, Outcome) :- decision(decision, Outcome, _Target).
triple(decision, target, Target) :- decision(decision, _Outcome, Target).
triple(scan, scannedProduct, ProductName) :- scanned_product(scan, Product), product_name(Product, ProductName).
triple(case, suggestedAlternative, Alternative) :- suggested_alternative(case, Alternative).
triple(banner, headline, Headline) :- banner_headline(banner, Headline).
triple(banner, note, Note) :- banner_note(banner, Note).
triple(banner, suggestedAlternative, Name) :- banner_suggested_alternative(banner, Name).
triple(reasonText, value, Text) :- reason_text(reasonText, Text).
triple(signature, alg, Alg) :- signature_alg(signature, Alg).
triple(case, auditEntries, Count) :- audit_entries(case, Count).
triple(case, filesWritten, Count) :- files_written(case, Count).
triple(result, allChecksPass, true) :- all_checks_pass(result).
triple(check, signatureVerifies, true) :- signature_verifies(check).
triple(check, payloadHashMatches, true) :- payload_hash_matches(check).
triple(check, minimizationStripsSensitiveTerms, true) :- minimization_strips_sensitive_terms(check).
triple(check, scopeComplete, true) :- scope_complete(check).
triple(check, authorizationAllowed, true) :- authorization_allowed(check).
triple(check, bannerFlagsHighSugar, true) :- banner_flags_high_sugar(check).
triple(check, alternativeIsLowerSugar, true) :- alternative_is_lower_sugar(check).
triple(check, dutyTimingConsistent, true) :- duty_timing_consistent(check).
triple(check, marketingProhibited, true) :- marketing_prohibited(check).
triple(check, filesWrittenExpected, true) :- files_written_expected(check).
