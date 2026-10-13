# A private household need becomes a low-sugar shopping insight.
# Each case keeps its own envelope, policy, signature, and checks.
the case-name of delfour is "delfour".
the household of delfour is household-profile.
the condition of household-profile is "Diabetes".
the request-purpose of delfour is shopping-assist.
the request-action of delfour is use.
the phone-created of delfour is "2025-10-05T20:33:48.907163+00:00".
the phone-expires of delfour is "2025-10-05T22:33:48.907185+00:00".
the authorization-time of delfour is "2025-10-05T20:35:48.907163+00:00".
the duty-time of delfour is "2025-10-05T20:37:48.907163+00:00".
the files-written of delfour is 6.
the audit-entries of delfour is 1.
the scanned-product of delfour is prod-bis-001.
the envelope of delfour is shopping-envelope.
the signature of delfour is scanner-signature.

# Product names, sugar in grams per serving, and shelves.
the display-id of prod-bis-001 is "prod_BIS_001".
the name of prod-bis-001 is "Classic Tea Biscuits".
the sugar of prod-bis-001 is 12.
the category of prod-bis-001 is biscuits.
the display-id of prod-bis-101 is "prod_BIS_101".
the name of prod-bis-101 is "Low-Sugar Tea Biscuits".
the sugar of prod-bis-101 is 3.
the category of prod-bis-101 is biscuits.
the display-id of prod-choc-050 is "prod_CHOC_050".
the name of prod-choc-050 is "Milk Chocolate Bar".
the sugar of prod-choc-050 is 15.
the category of prod-choc-050 is chocolate.
the display-id of prod-choc-150 is "prod_CHOC_150".
the name of prod-choc-150 is "85% Dark Chocolate".
the sugar of prod-choc-150 is 6.
the category of prod-choc-150 is chocolate.

# The insight carries shopping guidance without the private condition.
the metric of sugar-insight is "sugar_g_per_serving".
the threshold of sugar-insight is 10.
the threshold-display of sugar-insight is "10.0".
the suggestion-policy of sugar-insight is "lower_metric_first_higher_price_ok".
the device of sugar-insight is "self-scanner".
the event of sugar-insight is "pick_up_scanner".
the retailer of sugar-insight is "Delfour".
the created of sugar-insight is "2025-10-05T20:33:48.907163+00:00".
the expires of sugar-insight is "2025-10-05T22:33:48.907185+00:00".
the payload-text of sugar-insight is "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner".

# A policy belongs to its envelope; permissions are never global.
the permission of [shopping-policy, use, sugar-insight] is shopping-assist.
the prohibition of [shopping-policy, distribute, sugar-insight] is marketing.
the deletion-deadline of shopping-policy is "2025-10-05T22:33:48.907185+00:00".
the insight of shopping-envelope is sugar-insight.
the policy of shopping-envelope is shopping-policy.
the hash of shopping-envelope is "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098".

# Verification is supplied as trusted input. These rules do not compute HMAC.
the algorithm of scanner-signature is "HMAC-SHA256".
the key-id of scanner-signature is "demo-shared-secret".
the created of scanner-signature is "2025-10-05T20:33:48.907163+00:00".
the payload-hash of scanner-signature is "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098".
the hmac of scanner-signature is "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2".
the verification-mode of scanner-signature is trusted-precomputed-input.

# Project the envelope's fields while keeping the case attached.
if the envelope of first is second and the insight of second is third
then the case-insight of first is third.
if the envelope of first is second and the policy of second is third
then the case-policy of first is third.

if the household of first is second and the condition of second is "Diabetes"
then first is a low-sugar-case.
if first is a low-sugar-case and the case-insight of first is second
then the derived-need of [first, second] is low-sugar.

# Check the supplied signature declaration and compare the supplied digests.
if the signature of first is second
and the verification-mode of second is trusted-precomputed-input
then [first, trusted-signature] is a passed-check.

if the envelope of first is second and the signature of first is third
and the hash of second is fourth and the payload-hash of third is fourth
then [first, matching-hash] is a passed-check.

# Check only this insight's supplied payload text, not the private household.
if the case-insight of first is second and the payload-text of second is third
and not third contains the text "diabetes" and not third contains the text "medical"
then [first, minimal-payload] is a passed-check.

if the case-insight of first is second
and the device of second is third and the event of second is fourth
and the expires of second is fifth
then [first, complete-scope] is a passed-check.

# Timestamps share one UTC format, so their text order is also their time order.
if the case-insight of first is second and the case-policy of first is third
and the permission of [third, use, second] is shopping-assist
and the request-action of first is use and the request-purpose of first is shopping-assist
and the authorization-time of first is fourth and the expires of second is fifth
and fourth is at most fifth
then [first, authorization] is a passed-check.

if [first, authorization] is a passed-check then the outcome of first is "Allowed".
if [first, authorization] is a passed-check and the case-insight of first is second
then the target of first is second.

if the scanned-product of first is second and the name of second is third
then the scanned-name of first is third.
if the scanned-product of first is second and the category of second is third
then the scanned-category of first is third.
if the scanned-product of first is second and the sugar of second is third
then the scanned-sugar of first is third.

if [first, authorization] is a passed-check
and the scanned-sugar of first is second and the case-insight of first is third
and the threshold of third is fourth and second is at least fourth
then [first, high-sugar] is a passed-check.

if [first, high-sugar] is a passed-check
then the headline of first is "Track sugar per serving while you scan".
if [first, high-sugar] is a passed-check then the note of first is "High sugar".

# Consider only products from the same shelf with strictly less sugar.
if the scanned-category of first is second and the scanned-sugar of first is third
and the category of fourth is second and the sugar of fourth is fifth
and fifth is less than third
then first considers fourth.

# A candidate loses if another eligible candidate has even less sugar.
if first considers second and first considers third
and the sugar of second is fourth and the sugar of third is fifth
and fifth is less than fourth
then [first, second] is a beaten-candidate.

if first considers second and [first, second] is not a beaten-candidate
then the alternative of first is second.
if the alternative of first is second and the name of second is third
then the alternative-name of first is third.
if [first, high-sugar] is a passed-check and the alternative-name of first is second
then the banner-alternative of first is second.

if the scanned-sugar of first is second and the alternative of first is third
and the sugar of third is fourth and fourth is less than second
then [first, lower-sugar] is a passed-check.

if the case-insight of first is second and the duty-time of first is third
and the expires of second is fourth and third is at most fourth
then [first, duty-timing] is a passed-check.

if the case-policy of first is second and the case-insight of first is third
and the prohibition of [second, distribute, third] is marketing
then [first, marketing-prohibited] is a passed-check.

if the files-written of first is 6 then [first, expected-file-count] is a passed-check.

if [first, trusted-signature] is a passed-check
and [first, matching-hash] is a passed-check
and [first, minimal-payload] is a passed-check
and [first, complete-scope] is a passed-check
and [first, authorization] is a passed-check
and [first, high-sugar] is a passed-check
and [first, lower-sugar] is a passed-check
and [first, duty-timing] is a passed-check
and [first, marketing-prohibited] is a passed-check
and [first, expected-file-count] is a passed-check
then first is a checked-case.

if the case-insight of first is second
and the device of second is third and the event of second is fourth
then the scope of first is [third, fourth].

# Answer: the shopping decision, banner, and supporting case information.
what is the case-name of delfour?
is delfour a low-sugar-case?
what is the derived-need of [delfour, sugar-insight]?
# Reason: explain the derived low-sugar insight.
why?

# Continue with the shopping decision and supporting case information.
what is the outcome of delfour?
what is the target of delfour?
what is the metric of sugar-insight?
what is the threshold-display of sugar-insight?
what is the scope of delfour?
what is the retailer of sugar-insight?
what is the expires of sugar-insight?
what is the scanned-name of delfour?
what is the alternative-name of delfour?
what is the banner-alternative of delfour?
what is the headline of delfour?
what is the note of delfour?
what is the algorithm of scanner-signature?
what is the audit-entries of delfour?
what is the files-written of delfour?
# Check results: ten obligations must all be satisfied.
who is a passed-check?
is delfour a checked-case?

# Check: assert the expected decision and recommendation, and fail if any obligation is missing.
check that the outcome of delfour is "Allowed".
check that the note of delfour is "High sugar".
check that the alternative-name of delfour is "Low-Sugar Tea Biscuits".
check that there are 10 passed-checks.
check that delfour is a checked-case.
