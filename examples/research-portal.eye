# A hospital research portal passes two independent gates: research policy and device consent.
# Compare a modelled EU baseline with the original Digital Omnibus proposal,
# COM(2025) 837 final, 19 November 2025, after its modelled provisions apply.
# The proposal is a comparison scenario, not a statement of current law.
# Local names represent ODRL/DPV concepts; one research agreement applies in both rulebooks.
# Sources: https://www.w3.org/TR/odrl-model/ and https://w3id.org/dpv/2.3/dpv/
# https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:52025PC0837
# https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng
# https://eur-lex.europa.eu/eli/dir/2002/58/2009-12-19
# Inputs have single operand values, valid YYYYMMDD dates, and an acyclic purpose taxonomy.
# Device accesses involve personal data on a natural person's device; necessity,
# measurement aggregation and own use are assessed inputs. National exceptions,
# transition dates and media-provider exceptions are outside this model.
# Consent to device access never supplies consent to process health records.
# A device denial concerns this planned tracker; removing it may allow a different session.
# Duties and notifications are plans: actual consent, fulfilment and compliance are not proved.
# Refusals concern the same device purpose, with completed calendar months as input.
# Breach risk is supplied. Deadlines run from awareness, without undue delay and where feasible;
# no Article 34(3) exception applies to the high-risk case. All breaches must be documented.

# The purpose taxonomy and consortium membership.
academic-research has-broader-purpose research-and-development.
commercial-research has-broader-purpose research-and-development.
advertising has-broader-purpose marketing.
partner-be belongs-to consortium.
partner-us belongs-to consortium.

# One ODRL agreement: research permission, marketing and US-transfer prohibitions.
policy is an agreement.
the assigner of policy is hospital.
the conflict-strategies of policy is [prohibit].
the permissions of policy is [research].
the prohibitions of policy is [no-marketing, no-transfer-us].
the assignee of research is consortium.
the action of research is use.
the target of research is lab-results.
the constraints of research is [for-research, under-consent, consent-given, pseudonymised, before-2027].
the duty of research is deletion.
the duty-action of deletion is delete.
the duty-days of deletion is 90.
the assignee of no-marketing is consortium.
the action of no-marketing is distribute.
the target of no-marketing is lab-results.
the constraints of no-marketing is [for-marketing].
the assignee of no-transfer-us is partner-us.
the action of no-transfer-us is use.
the target of no-transfer-us is lab-results.
the constraints of no-transfer-us is [].

# Each constraint states [operand, operator, expected value].
the constraint of for-research is [purpose, within, research-and-development].
the constraint of under-consent is [legal-basis, equal, consent].
the constraint of consent-given is [consent-status, equal, consent-given].
the constraint of pseudonymised is [technical-measure, equal, pseudonymisation].
the constraint of before-2027 is [date, less-than, 20270101].
the constraint of for-marketing is [purpose, within, marketing].

# A DPV process: [controller, requester, processing, data, purpose, basis, consent, measure, date].
the process of r1 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r2 is [hospital, partner-be, use, lab-results, personalised-advertising, legitimate-interest, consent-unknown, pseudonymisation, 20261115].
the process of r3 is [hospital, partner-be, share, lab-results, advertising, consent, consent-given, pseudonymisation, 20261115].
the process of r4 is [hospital, partner-be, use, lab-results, commercial-research, consent, consent-withdrawn, pseudonymisation, 20261115].
the process of r5 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, encryption, 20270301].
the process of r6 is [hospital, partner-us, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r7 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r8 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r9 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r10 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].
the process of r11 is [hospital, partner-be, share, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].

?process is a research-process if the process of ?process is ?profile.
the controller of ?process is ?controller if the process of ?process is [?controller | ?rest].
the requester of ?process is ?requester if the process of ?process is [?controller, ?requester | ?rest].
the processing of ?process is ?processing if the process of ?process is [?controller, ?requester, ?processing | ?rest].
the data of ?process is ?data if the process of ?process is [?controller, ?requester, ?processing, ?data | ?rest].
the operand of [?process, purpose] is ?purpose if the process of ?process is [?controller, ?requester, ?processing, ?data, ?purpose | ?rest].
the operand of [?process, legal-basis] is ?basis if the process of ?process is [?controller, ?requester, ?processing, ?data, ?purpose, ?basis | ?rest].
the operand of [?process, consent-status] is ?consent if the process of ?process is [?controller, ?requester, ?processing, ?data, ?purpose, ?basis, ?consent | ?rest].
the operand of [?process, technical-measure] is ?measure if the process of ?process is [?controller, ?requester, ?processing, ?data, ?purpose, ?basis, ?consent, ?measure | ?rest].
the operand of [?process, date] is ?date if the process of ?process is [?controller, ?requester, ?processing, ?data, ?purpose, ?basis, ?consent, ?measure, ?date].
the mapped-action of use is use.
the mapped-action of share is distribute.

# Reflexive membership is generated for the parties and purposes in this program.
if the requester of ?process is ?party then ?party is a party.
if the assignee of ?rule is ?party then ?party is a party.
?party is-member-of ?party if ?party is a party.
?party is-member-of ?group if ?party belongs-to ?group.
if the operand of [?process, purpose] is ?purpose then ?purpose is a purpose.
if ?purpose has-broader-purpose ?broader then ?purpose is a purpose.
if ?purpose has-broader-purpose ?broader then ?broader is a purpose.
if the constraint of ?constraint is [?operand, within, ?purpose] then ?purpose is a purpose.
?purpose falls-within ?purpose if ?purpose is a purpose.
?purpose falls-within ?class if ?purpose has-broader-purpose ?middle and ?middle falls-within ?class.

# Rule matching: requester, mapped action and target must all match.
?process addresses ?rule
if the requester of ?process is ?requester
and the assignee of ?rule is ?assignee and ?requester is-member-of ?assignee
and the processing of ?process is ?processing and the mapped-action of ?processing is ?action
and the action of ?rule is ?action and the data of ?process is ?data and the target of ?rule is ?data.

if the constraint of ?constraint is [?operand, equal, ?expected]
and the operand of [?process, ?operand] is ?expected
then [?process, ?constraint] is a met-constraint.
if the constraint of ?constraint is [?operand, less-than, ?limit]
and the operand of [?process, ?operand] is ?value and ?value is less than ?limit
then [?process, ?constraint] is a met-constraint.
if the constraint of ?constraint is [?operand, within, ?class]
and the operand of [?process, ?operand] is ?value and ?value falls-within ?class
then [?process, ?constraint] is a met-constraint.

# Walk the supplied constraint list to collect every failure in its declared order.
the failures of [?process, []] is [] if ?process is a research-process.
the failures of [?process, [?constraint | ?rest]] is ?failures
if [?process, ?constraint] is a met-constraint and the failures of [?process, ?rest] is ?failures.
the failures of [?process, [?constraint | ?rest]] is [[unmet, ?constraint, ?operand, ?value, ?operator, ?expected] | ?failures]
if ?process is a research-process and the constraint of ?constraint is [?operand, ?operator, ?expected]
and the operand of [?process, ?operand] is ?value and [?process, ?constraint] is not a met-constraint
and the failures of [?process, ?rest] is ?failures.

# List membership and concatenation keep policy data separate from the evaluator.
the member of [?head | ?rest] is ?head if ?head is equal to ?head.
the member of [?head | ?rest] is ?member if the member of ?rest is ?member.
the joined of [[], ?right] is ?right if ?right is equal to ?right.
the joined of [[?head | ?rest], ?right] is [?head | ?joined] if the joined of [?rest, ?right] is ?joined.

?policy governs ?process
if ?policy is an agreement and the assigner of ?policy is ?controller and the controller of ?process is ?controller.
if ?process addresses ?rule and the constraints of ?rule is ?constraints
and the failures of [?process, ?constraints] is [] then [?process, ?rule] is an applied-rule.
if ?policy governs ?process and the permissions of ?policy is ?rules
and the member of ?rules is ?rule and [?process, ?rule] is an applied-rule
then ?process is-permitted-by ?rule.
if ?policy governs ?process and the prohibitions of ?policy is ?rules
and the member of ?rules is ?rule and [?process, ?rule] is an applied-rule
then ?process is-prohibited-by ?rule.
if ?policy governs ?process and the permissions of ?policy is ?rules
and the member of ?rules is ?rule and ?process addresses ?rule
then ?process is-candidate-for ?rule.
if ?process is-permitted-by ?rule then ?process is a permitted-process.
if ?process is-prohibited-by ?rule then ?process is a prohibited-process.
if ?process is-candidate-for ?rule then ?process is a candidate-process.
if ?policy governs ?process and the conflict-strategies of ?policy is [prohibit]
then ?process is a policy-ready-process.

# Collect failed constraints across the fixed agreement's permission list.
the permission-failures of [?process, []] is [] if ?process is a research-process.
the permission-failures of [?process, [?rule | ?rest]] is ?all
if ?process addresses ?rule and the constraints of ?rule is ?constraints
and the failures of [?process, ?constraints] is ?failures
and the permission-failures of [?process, ?rest] is ?remaining
and the joined of [?failures, ?remaining] is ?all.
the permission-failures of [?process, [?rule | ?rest]] is ?remaining
if ?process is a research-process and ?process does not address ?rule
and the permission-failures of [?process, ?rest] is ?remaining.

# Gate 1: prohibition takes precedence over permission.
the policy-result of ?process is [permit, ?rule]
if ?process is a policy-ready-process and ?process is-permitted-by ?rule and ?process is not a prohibited-process.
the policy-result of ?process is [deny, [prohibited-by, ?rule]]
if ?process is a policy-ready-process and ?process is-prohibited-by ?rule.
the policy-result of ?process is [deny, [not-permitted, ?reasons]]
if ?process is a policy-ready-process and ?process is a candidate-process
and ?process is not a permitted-process and ?process is not a prohibited-process
and ?policy governs ?process and the permissions of ?policy is ?rules
and the permission-failures of [?process, ?rules] is ?reasons.
the policy-result of ?process is [deny, no-matching-permission]
if ?process is a research-process and ?process is a policy-ready-process
and ?process is not a candidate-process and ?process is not a prohibited-process.
if ?process is a policy-ready-process and ?process is-permitted-by ?permission and ?process is-prohibited-by ?prohibition
then the policy-conflict of ?process is [resolved-by, prohibit, ?prohibition, [overrides, ?permission]].

# Gate 2: the session states [device access, previous visitor choice].
the session of r1 is [own-audience-measurement, first-visit].
the session of r2 is [own-audience-measurement, first-visit].
the session of r3 is [advertising, [browser-signal, refuse]].
the session of r4 is [own-audience-measurement, first-visit].
the session of r5 is [requested-service, first-visit].
the session of r6 is [own-audience-measurement, first-visit].
the session of r7 is [advertising, [browser-signal, refuse]].
the session of r8 is [advertising, [refused, [completed-months, 5]]].
the session of r9 is [advertising, [refused, [completed-months, 6]]].
the session of r10 is [requested-service, first-visit].
the session of r11 is [requested-service, first-visit].
baseline is a rulebook. omnibus-proposal is a rulebook.
the media-service of portal is no.
the refusal-pause of portal is 6.
the consent of [baseline, requested-service] is [not-needed, "ePrivacy Art. 5(3)"].
the consent of [baseline, own-audience-measurement] is [needed, "ePrivacy Art. 5(3)"].
the consent of [baseline, advertising] is [needed, "ePrivacy Art. 5(3)"].
the consent of [omnibus-proposal, requested-service] is [not-needed, "GDPR Art. 88a(3)(b)"].
the consent of [omnibus-proposal, own-audience-measurement] is [not-needed, "GDPR Art. 88a(3)(c)"].
the consent of [omnibus-proposal, advertising] is [needed, "GDPR Art. 88a(1)"].

# Asking is only a next step; it never establishes that consent was obtained.
the ask of [baseline, ?choice] is [ask-for-consent, "ePrivacy Art. 5(3)"]
if the session of ?process is [?kind, ?choice].
the ask of [omnibus-proposal, [browser-signal, refuse]] is [refused-by-signal, "GDPR Art. 88b(1)-(2)"]
if the media-service of portal is no.
the ask of [omnibus-proposal, [refused, [completed-months, ?months]]] is [do-not-ask-again, "GDPR Art. 88a(4)(c)"]
if the session of ?process is [?kind, [refused, [completed-months, ?months]]]
and ?months is at least 0 and the refusal-pause of portal is ?minimum and ?months is less than ?minimum.
the ask of [omnibus-proposal, [refused, [completed-months, ?months]]] is [ask-for-consent, "GDPR Art. 88a(4)(c)"]
if the session of ?process is [?kind, [refused, [completed-months, ?months]]]
and ?months is at least 0 and the refusal-pause of portal is ?minimum and ?months is at least ?minimum.
the device-basis of [?provision, ?provision] is [policy, ?provision] if ?provision is equal to ?provision.
the device-basis of [?provision, ?next] is [policy, ?provision, ?next] if not ?provision is equal to ?next.

# Combine the gates. Every assessment keeps its decision and cited basis together.
if ?rulebook is a rulebook and the session of ?process is ?session
and the policy-result of ?process is [deny, ?reason]
then the assessment of [?rulebook, ?process] is [[deny-policy, ?reason], [policy]].
if ?rulebook is a rulebook and the policy-result of ?process is [permit, ?rule]
and the session of ?process is [?kind, ?choice] and the consent of [?rulebook, ?kind] is [not-needed, ?provision]
then the assessment of [?rulebook, ?process] is [[permit, ?rule], [policy, ?provision]].
if ?rulebook is a rulebook and the policy-result of ?process is [permit, ?rule]
and the session of ?process is [?kind, ?choice] and the consent of [?rulebook, ?kind] is [needed, ?provision]
and the ask of [?rulebook, ?choice] is [ask-for-consent, ?next] and the device-basis of [?provision, ?next] is ?basis
then the assessment of [?rulebook, ?process] is [[await-device-consent, ?rule], ?basis].
if ?rulebook is a rulebook and the policy-result of ?process is [permit, ?rule]
and the session of ?process is [?kind, ?choice] and the consent of [?rulebook, ?kind] is [needed, ?provision]
and the ask of [?rulebook, ?choice] is [?reason, ?next] and not ?reason is equal to ask-for-consent
and the device-basis of [?provision, ?next] is ?basis
then the assessment of [?rulebook, ?process] is [[deny-device, ?reason], ?basis].

# Deletion duties attach only to final permits, never to a pending consent request.
if the assessment of [?rulebook, ?process] is [[permit, ?rule], ?basis]
and the duty of ?rule is ?duty and the duty-action of ?duty is ?action and the duty-days of ?duty is ?days
then the planned-duty of [?rulebook, ?process] is [?action, [within-days, ?days]].

# Breaches concern existing portal data and are independent of planned sessions.
the breach of b1 is ["encrypted laptop lost, key safe", unlikely].
the breach of b2 is ["researcher contact addresses exposed", some].
the breach of b3 is ["patient lab records exposed", high].
the authority of [baseline, unlikely] is [none, "GDPR Art. 33(1)"].
the authority of [baseline, some] is [[within-hours, 72], "GDPR Art. 33(1)"].
the authority of [baseline, high] is [[within-hours, 72], "GDPR Art. 33(1)"].
the authority of [omnibus-proposal, unlikely] is [none, "GDPR Art. 33(1) as amended"].
the authority of [omnibus-proposal, some] is [none, "GDPR Art. 33(1) as amended"].
the authority of [omnibus-proposal, high] is [[within-hours-via-single-entry-point, 96], "GDPR Art. 33(1) as amended"].
the people of unlikely is [none, "GDPR Art. 34(1)"].
the people of some is [none, "GDPR Art. 34(1)"].
the people of high is [without-undue-delay, "GDPR Art. 34(1)"].
if ?rulebook is a rulebook and the breach of ?breach is [?description, ?risk]
and the authority of [?rulebook, ?risk] is [?when, ?authority-basis] and the people of ?risk is [?how, ?people-basis]
then the breach-plan of [?rulebook, ?breach] is [[notify, [authority, ?when], [people, ?how]], document-breach, [?authority-basis, ?people-basis, "GDPR Art. 33(5)"]].

# Compare decisions and notification plans, ignoring changes of citation alone.
if the assessment of [baseline, ?process] is [?old, ?old-basis]
and the assessment of [omnibus-proposal, ?process] is [?new, ?new-basis] and not ?old is equal to ?new
then the change of [session, ?process] is [from, ?old, to, ?new].
if the breach-plan of [baseline, ?breach] is [?old, ?document, ?old-basis]
and the breach-plan of [omnibus-proposal, ?breach] is [?new, ?document, ?new-basis] and not ?old is equal to ?new
then the change of [breach, ?breach] is [from, ?old, to, ?new].

# Classify results so checks can count complete sets.
if the assessment of ?session is ?result then ?session is an assessed-session.
if the planned-duty of ?session is ?duty then ?session is a planned-deletion.
if the breach-plan of ?incident is ?plan then ?incident is a planned-breach.
if the change of ?item is ?difference then ?item is a changed-outcome.
if the policy-conflict of ?process is ?conflict then ?process is a conflicting-process.

# Answer: all 37 modelled outcomes, including the basis for each assessment and breach plan.
the assessment of ?session is ?result?
the breach-plan of ?incident is ?plan?
the planned-duty of ?session is ?duty?
the policy-conflict of ?process is ?conflict?
the change of ?item is ?difference?

# Reason: why the proposed audience-measurement rule lets r1 proceed through both gates.
what is the assessment of [omnibus-proposal, r1]?
why?

# Check: both gates, strict time boundaries, refusal handling, duties and breach reporting.
check that there are 22 assessed-sessions.
check that there are 6 planned-breaches.
check that there are 3 planned-deletions.
check that there are 5 changed-outcomes.
check that there is 1 conflicting-process.
check that the policy-result of r1 is [permit, research].
check that the assessment of [baseline, r1] is [[await-device-consent, research], [policy, "ePrivacy Art. 5(3)"]].
check that the assessment of [omnibus-proposal, r1] is [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]].
check that the assessment of [omnibus-proposal, r7] is [[deny-device, refused-by-signal], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"]].
check that the assessment of [omnibus-proposal, r8] is [[deny-device, do-not-ask-again], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]].
check that the assessment of [omnibus-proposal, r9] is [[await-device-consent, research], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]].
check that the policy-result of r3 is [deny, [prohibited-by, no-marketing]].
check that the policy-result of r4 is [deny, [not-permitted, [[unmet, consent-given, consent-status, consent-withdrawn, equal, consent-given]]]].
check that the policy-result of r5 is [deny, [not-permitted, [[unmet, pseudonymised, technical-measure, encryption, equal, pseudonymisation], [unmet, before-2027, date, 20270301, less-than, 20270101]]]].
check that the policy-result of r6 is [deny, [prohibited-by, no-transfer-us]].
check that the policy-conflict of r6 is [resolved-by, prohibit, no-transfer-us, [overrides, research]].
check that the policy-result of r11 is [deny, no-matching-permission].
check that not the planned-duty of [baseline, r1] is [delete, [within-days, 90]].
