% A hospital research portal passes two independent gates: research policy and device consent.
% Compare a modelled EU baseline with the original Digital Omnibus proposal,
% COM(2025) 837 final, 19 November 2025, after its modelled provisions apply.
% The proposal is a comparison scenario, not a statement of current law.
% Local names represent ODRL/DPV concepts; one research agreement applies in both rulebooks.
% Sources: https://www.w3.org/TR/odrl-model/ and https://w3id.org/dpv/2.3/dpv/
% https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:52025PC0837
% https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng
% https://eur-lex.europa.eu/eli/dir/2002/58/2009-12-19
% Inputs have single operand values, valid YYYYMMDD dates, and an acyclic purpose taxonomy.
% Device accesses involve personal data on a natural person's device; necessity,
% measurement aggregation and own use are assessed inputs. National exceptions,
% transition dates and media-provider exceptions are outside this model.
% Consent to device access never supplies consent to process health records.
% A device denial concerns this planned tracker; removing it may allow a different session.
% Duties and notifications are plans: actual consent, fulfilment and compliance are not proved.
% Refusals concern the same device purpose, with completed calendar months as input.
% Breach risk is supplied. Deadlines run from awareness, without undue delay and where feasible;
% no Article 34(3) exception applies to the high-risk case. All breaches must be documented.
% The purpose taxonomy and consortium membership.
% One ODRL agreement: research permission, marketing and US-transfer prohibitions.
% Each constraint states [operand, operator, expected value].
% A DPV process: [controller, requester, processing, data, purpose, basis, consent, measure, date].
% Reflexive membership is generated for the parties and purposes in this program.
% Rule matching: requester, mapped action and target must all match.
% Walk the supplied constraint list to collect every failure in its declared order.
% List membership and concatenation keep policy data separate from the evaluator.
% Collect failed constraints across the fixed agreement's permission list.
% Gate 1: prohibition takes precedence over permission.
% Gate 2: the session states [device access, previous visitor choice].
% Asking is only a next step; it never establishes that consent was obtained.
% Combine the gates. Every assessment keeps its decision and cited basis together.
% Deletion duties attach only to final permits, never to a pending consent request.
% Breaches concern existing portal data and are independent of planned sessions.
% Compare decisions and notification plans, ignoring changes of citation alone.
% Classify results so checks can count complete sets.

% Prolog facts and rules.
:- table is_a/2.
:- table controller/2.
:- table requester/2.
:- table processing/2.
:- table data/2.
:- table operand/2.
:- table 'is-member-of'/2.
:- table 'falls-within'/2.
:- table addresses/2.
:- table failures/2.
:- table member/2.
:- table joined/2.
:- table governs/2.
:- table 'permission-failures'/2.
:- table 'policy-result'/2.
:- table ask/2.
:- table 'device-basis'/2.
'has-broader-purpose'('academic-research', 'research-and-development').
'has-broader-purpose'('commercial-research', 'research-and-development').
'has-broader-purpose'(advertising, marketing).
'belongs-to'('partner-be', consortium).
'belongs-to'('partner-us', consortium).
is_a(policy, agreement).
assigner(policy, hospital).
'conflict-strategies'(policy, [prohibit]).
permissions(policy, [research]).
prohibitions(policy, ['no-marketing', 'no-transfer-us']).
assignee(research, consortium).
action(research, use).
target(research, 'lab-results').
constraints(research, ['for-research', 'under-consent', 'consent-given', pseudonymised, 'before-2027']).
duty(research, deletion).
'duty-action'(deletion, delete).
'duty-days'(deletion, 90).
assignee('no-marketing', consortium).
action('no-marketing', distribute).
target('no-marketing', 'lab-results').
constraints('no-marketing', ['for-marketing']).
assignee('no-transfer-us', 'partner-us').
action('no-transfer-us', use).
target('no-transfer-us', 'lab-results').
constraints('no-transfer-us', []).
constraint('for-research', [purpose, within, 'research-and-development']).
constraint('under-consent', ['legal-basis', equal, consent]).
constraint('consent-given', ['consent-status', equal, 'consent-given']).
constraint(pseudonymised, ['technical-measure', equal, pseudonymisation]).
constraint('before-2027', [date, 'less-than', 20270101]).
constraint('for-marketing', [purpose, within, marketing]).
process(r1, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r2, [hospital, 'partner-be', use, 'lab-results', 'personalised-advertising', 'legitimate-interest', 'consent-unknown', pseudonymisation, 20261115]).
process(r3, [hospital, 'partner-be', share, 'lab-results', advertising, consent, 'consent-given', pseudonymisation, 20261115]).
process(r4, [hospital, 'partner-be', use, 'lab-results', 'commercial-research', consent, 'consent-withdrawn', pseudonymisation, 20261115]).
process(r5, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', encryption, 20270301]).
process(r6, [hospital, 'partner-us', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r7, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r8, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r9, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r10, [hospital, 'partner-be', use, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
process(r11, [hospital, 'partner-be', share, 'lab-results', 'academic-research', consent, 'consent-given', pseudonymisation, 20261115]).
'mapped-action'(use, use).
'mapped-action'(share, distribute).
session(r1, ['own-audience-measurement', 'first-visit']).
session(r2, ['own-audience-measurement', 'first-visit']).
session(r3, [advertising, ['browser-signal', refuse]]).
session(r4, ['own-audience-measurement', 'first-visit']).
session(r5, ['requested-service', 'first-visit']).
session(r6, ['own-audience-measurement', 'first-visit']).
session(r7, [advertising, ['browser-signal', refuse]]).
session(r8, [advertising, [refused, ['completed-months', 5]]]).
session(r9, [advertising, [refused, ['completed-months', 6]]]).
session(r10, ['requested-service', 'first-visit']).
session(r11, ['requested-service', 'first-visit']).
is_a(baseline, rulebook).
is_a('omnibus-proposal', rulebook).
'media-service'(portal, no).
'refusal-pause'(portal, 6).
consent([baseline, 'requested-service'], ['not-needed', "ePrivacy Art. 5(3)"]).
consent([baseline, 'own-audience-measurement'], [needed, "ePrivacy Art. 5(3)"]).
consent([baseline, advertising], [needed, "ePrivacy Art. 5(3)"]).
consent(['omnibus-proposal', 'requested-service'], ['not-needed', "GDPR Art. 88a(3)(b)"]).
consent(['omnibus-proposal', 'own-audience-measurement'], ['not-needed', "GDPR Art. 88a(3)(c)"]).
consent(['omnibus-proposal', advertising], [needed, "GDPR Art. 88a(1)"]).
breach(b1, ["encrypted laptop lost, key safe", unlikely]).
breach(b2, ["researcher contact addresses exposed", some]).
breach(b3, ["patient lab records exposed", high]).
authority([baseline, unlikely], [none, "GDPR Art. 33(1)"]).
authority([baseline, some], [['within-hours', 72], "GDPR Art. 33(1)"]).
authority([baseline, high], [['within-hours', 72], "GDPR Art. 33(1)"]).
authority(['omnibus-proposal', unlikely], [none, "GDPR Art. 33(1) as amended"]).
authority(['omnibus-proposal', some], [none, "GDPR Art. 33(1) as amended"]).
authority(['omnibus-proposal', high], [['within-hours-via-single-entry-point', 96], "GDPR Art. 33(1) as amended"]).
people(unlikely, [none, "GDPR Art. 34(1)"]).
people(some, [none, "GDPR Art. 34(1)"]).
people(high, ['without-undue-delay', "GDPR Art. 34(1)"]).

is_a(Process, 'research-process') :-
    process(Process, Profile).
controller(Process, Controller) :-
    process(Process, [Controller | Rest]).
requester(Process, Requester) :-
    process(Process, [Controller, Requester | Rest]).
processing(Process, Processing) :-
    process(Process, [Controller, Requester, Processing | Rest]).
data(Process, Data) :-
    process(Process, [Controller, Requester, Processing, Data | Rest]).
operand([Process, purpose], Purpose) :-
    process(Process, [Controller, Requester, Processing, Data, Purpose | Rest]).
operand([Process, 'legal-basis'], Basis) :-
    process(Process, [Controller, Requester, Processing, Data, Purpose, Basis | Rest]).
operand([Process, 'consent-status'], Consent) :-
    process(Process, [Controller, Requester, Processing, Data, Purpose, Basis, Consent | Rest]).
operand([Process, 'technical-measure'], Measure) :-
    process(Process, [Controller, Requester, Processing, Data, Purpose, Basis, Consent, Measure | Rest]).
operand([Process, date], Date) :-
    process(Process, [Controller, Requester, Processing, Data, Purpose, Basis, Consent, Measure, Date]).
is_a(Party, party) :-
    requester(Process, Party).
is_a(Party, party) :-
    assignee(Rule, Party).
'is-member-of'(Party, Party) :-
    is_a(Party, party).
'is-member-of'(Party, Group) :-
    'belongs-to'(Party, Group).
is_a(Purpose, purpose) :-
    operand([Process, purpose], Purpose).
is_a(Purpose, purpose) :-
    'has-broader-purpose'(Purpose, Broader).
is_a(Broader, purpose) :-
    'has-broader-purpose'(Purpose, Broader).
is_a(Purpose, purpose) :-
    constraint(Constraint, [Operand, within, Purpose]).
'falls-within'(Purpose, Purpose) :-
    is_a(Purpose, purpose).
'falls-within'(Purpose, Class) :-
    'has-broader-purpose'(Purpose, Middle),
    'falls-within'(Middle, Class).
addresses(Process, Rule) :-
    requester(Process, Requester),
    assignee(Rule, Assignee),
    'is-member-of'(Requester, Assignee),
    processing(Process, Processing),
    'mapped-action'(Processing, Action),
    action(Rule, Action),
    data(Process, Data),
    target(Rule, Data).
is_a([Process, Constraint], 'met-constraint') :-
    constraint(Constraint, [Operand, equal, Expected]),
    operand([Process, Operand], Expected).
is_a([Process, Constraint], 'met-constraint') :-
    constraint(Constraint, [Operand, 'less-than', Limit]),
    operand([Process, Operand], Value),
    Value < Limit.
is_a([Process, Constraint], 'met-constraint') :-
    constraint(Constraint, [Operand, within, Class]),
    operand([Process, Operand], Value),
    'falls-within'(Value, Class).
failures([Process, []], []) :-
    is_a(Process, 'research-process').
failures([Process, [Constraint | Rest]], Failures) :-
    is_a([Process, Constraint], 'met-constraint'),
    failures([Process, Rest], Failures).
failures([Process, [Constraint | Rest]], [[unmet, Constraint, Operand, Value, Operator, Expected] | Failures]) :-
    is_a(Process, 'research-process'),
    constraint(Constraint, [Operand, Operator, Expected]),
    operand([Process, Operand], Value),
    \+ (is_a([Process, Constraint], 'met-constraint')),
    failures([Process, Rest], Failures).
member([Head | Rest], Head) :-
    Head = Head.
member([Head | Rest], Member) :-
    member(Rest, Member).
joined([[], Right], Right) :-
    Right = Right.
joined([[Head | Rest], Right], [Head | Joined]) :-
    joined([Rest, Right], Joined).
governs(Policy, Process) :-
    is_a(Policy, agreement),
    assigner(Policy, Controller),
    controller(Process, Controller).
is_a([Process, Rule], 'applied-rule') :-
    addresses(Process, Rule),
    constraints(Rule, Constraints),
    failures([Process, Constraints], []).
'is-permitted-by'(Process, Rule) :-
    governs(Policy, Process),
    permissions(Policy, Rules),
    member(Rules, Rule),
    is_a([Process, Rule], 'applied-rule').
'is-prohibited-by'(Process, Rule) :-
    governs(Policy, Process),
    prohibitions(Policy, Rules),
    member(Rules, Rule),
    is_a([Process, Rule], 'applied-rule').
'is-candidate-for'(Process, Rule) :-
    governs(Policy, Process),
    permissions(Policy, Rules),
    member(Rules, Rule),
    addresses(Process, Rule).
is_a(Process, 'permitted-process') :-
    'is-permitted-by'(Process, Rule).
is_a(Process, 'prohibited-process') :-
    'is-prohibited-by'(Process, Rule).
is_a(Process, 'candidate-process') :-
    'is-candidate-for'(Process, Rule).
is_a(Process, 'policy-ready-process') :-
    governs(Policy, Process),
    'conflict-strategies'(Policy, [prohibit]).
'permission-failures'([Process, []], []) :-
    is_a(Process, 'research-process').
'permission-failures'([Process, [Rule | Rest]], All) :-
    addresses(Process, Rule),
    constraints(Rule, Constraints),
    failures([Process, Constraints], Failures),
    'permission-failures'([Process, Rest], Remaining),
    joined([Failures, Remaining], All).
'permission-failures'([Process, [Rule | Rest]], Remaining) :-
    is_a(Process, 'research-process'),
    \+ (addresses(Process, Rule)),
    'permission-failures'([Process, Rest], Remaining).
'policy-result'(Process, [permit, Rule]) :-
    is_a(Process, 'policy-ready-process'),
    'is-permitted-by'(Process, Rule),
    \+ (is_a(Process, 'prohibited-process')).
'policy-result'(Process, [deny, ['prohibited-by', Rule]]) :-
    is_a(Process, 'policy-ready-process'),
    'is-prohibited-by'(Process, Rule).
'policy-result'(Process, [deny, ['not-permitted', Reasons]]) :-
    is_a(Process, 'policy-ready-process'),
    is_a(Process, 'candidate-process'),
    \+ (is_a(Process, 'permitted-process')),
    \+ (is_a(Process, 'prohibited-process')),
    governs(Policy, Process),
    permissions(Policy, Rules),
    'permission-failures'([Process, Rules], Reasons).
'policy-result'(Process, [deny, 'no-matching-permission']) :-
    is_a(Process, 'research-process'),
    is_a(Process, 'policy-ready-process'),
    \+ (is_a(Process, 'candidate-process')),
    \+ (is_a(Process, 'prohibited-process')).
'policy-conflict'(Process, ['resolved-by', prohibit, Prohibition, [overrides, Permission]]) :-
    is_a(Process, 'policy-ready-process'),
    'is-permitted-by'(Process, Permission),
    'is-prohibited-by'(Process, Prohibition).
ask([baseline, Choice], ['ask-for-consent', "ePrivacy Art. 5(3)"]) :-
    session(Process, [Kind, Choice]).
ask(['omnibus-proposal', ['browser-signal', refuse]], ['refused-by-signal', "GDPR Art. 88b(1)-(2)"]) :-
    'media-service'(portal, no).
ask(['omnibus-proposal', [refused, ['completed-months', Months]]], ['do-not-ask-again', "GDPR Art. 88a(4)(c)"]) :-
    session(Process, [Kind, [refused, ['completed-months', Months]]]),
    Months >= 0,
    'refusal-pause'(portal, Minimum),
    Months < Minimum.
ask(['omnibus-proposal', [refused, ['completed-months', Months]]], ['ask-for-consent', "GDPR Art. 88a(4)(c)"]) :-
    session(Process, [Kind, [refused, ['completed-months', Months]]]),
    Months >= 0,
    'refusal-pause'(portal, Minimum),
    Months >= Minimum.
'device-basis'([Provision, Provision], [policy, Provision]) :-
    Provision = Provision.
'device-basis'([Provision, Next], [policy, Provision, Next]) :-
    \+ (Provision = Next).
assessment([Rulebook, Process], [['deny-policy', Reason], [policy]]) :-
    is_a(Rulebook, rulebook),
    session(Process, Session),
    'policy-result'(Process, [deny, Reason]).
assessment([Rulebook, Process], [[permit, Rule], [policy, Provision]]) :-
    is_a(Rulebook, rulebook),
    'policy-result'(Process, [permit, Rule]),
    session(Process, [Kind, Choice]),
    consent([Rulebook, Kind], ['not-needed', Provision]).
assessment([Rulebook, Process], [['await-device-consent', Rule], Basis]) :-
    is_a(Rulebook, rulebook),
    'policy-result'(Process, [permit, Rule]),
    session(Process, [Kind, Choice]),
    consent([Rulebook, Kind], [needed, Provision]),
    ask([Rulebook, Choice], ['ask-for-consent', Next]),
    'device-basis'([Provision, Next], Basis).
assessment([Rulebook, Process], [['deny-device', Reason], Basis]) :-
    is_a(Rulebook, rulebook),
    'policy-result'(Process, [permit, Rule]),
    session(Process, [Kind, Choice]),
    consent([Rulebook, Kind], [needed, Provision]),
    ask([Rulebook, Choice], [Reason, Next]),
    \+ (Reason = 'ask-for-consent'),
    'device-basis'([Provision, Next], Basis).
'planned-duty'([Rulebook, Process], [Action, ['within-days', Days]]) :-
    assessment([Rulebook, Process], [[permit, Rule], Basis]),
    duty(Rule, Duty),
    'duty-action'(Duty, Action),
    'duty-days'(Duty, Days).
'breach-plan'([Rulebook, Breach], [[notify, [authority, When], [people, How]], 'document-breach', [AuthorityBasis, PeopleBasis, "GDPR Art. 33(5)"]]) :-
    is_a(Rulebook, rulebook),
    breach(Breach, [Description, Risk]),
    authority([Rulebook, Risk], [When, AuthorityBasis]),
    people(Risk, [How, PeopleBasis]).
change([session, Process], [from, Old, to, New]) :-
    assessment([baseline, Process], [Old, OldBasis]),
    assessment(['omnibus-proposal', Process], [New, NewBasis]),
    \+ (Old = New).
change([breach, Breach], [from, Old, to, New]) :-
    'breach-plan'([baseline, Breach], [Old, Document, OldBasis]),
    'breach-plan'(['omnibus-proposal', Breach], [New, Document, NewBasis]),
    \+ (Old = New).
is_a(Session, 'assessed-session') :-
    assessment(Session, Result).
is_a(Session, 'planned-deletion') :-
    'planned-duty'(Session, Duty).
is_a(Incident, 'planned-breach') :-
    'breach-plan'(Incident, Plan).
is_a(Item, 'changed-outcome') :-
    change(Item, Difference).
is_a(Process, 'conflicting-process') :-
    'policy-conflict'(Process, Conflict).

% Answer and Reason
?- assessment(Session, Result).
?- 'breach-plan'(Incident, Plan).
?- 'planned-duty'(Session, Duty).
?- 'policy-conflict'(Process, Conflict).
?- change(Item, Difference).
?- assessment(['omnibus-proposal', r1], What).
?- why.

% Check
:- assertion((aggregate_all(count, is_a(Subject, 'assessed-session'), 22))).
:- assertion((aggregate_all(count, is_a(Subject, 'planned-breach'), 6))).
:- assertion((aggregate_all(count, is_a(Subject, 'planned-deletion'), 3))).
:- assertion((aggregate_all(count, is_a(Subject, 'changed-outcome'), 5))).
:- assertion((aggregate_all(count, is_a(Subject, 'conflicting-process'), 1))).
:- assertion(('policy-result'(r1, [permit, research]))).
:- assertion((assessment([baseline, r1], [['await-device-consent', research], [policy, "ePrivacy Art. 5(3)"]]))).
:- assertion((assessment(['omnibus-proposal', r1], [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]]))).
:- assertion((assessment(['omnibus-proposal', r7], [['deny-device', 'refused-by-signal'], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"]]))).
:- assertion((assessment(['omnibus-proposal', r8], [['deny-device', 'do-not-ask-again'], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]]))).
:- assertion((assessment(['omnibus-proposal', r9], [['await-device-consent', research], [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]]))).
:- assertion(('policy-result'(r3, [deny, ['prohibited-by', 'no-marketing']]))).
:- assertion(('policy-result'(r4, [deny, ['not-permitted', [[unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal, 'consent-given']]]]))).
:- assertion(('policy-result'(r5, [deny, ['not-permitted', [[unmet, pseudonymised, 'technical-measure', encryption, equal, pseudonymisation], [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]]]]))).
:- assertion(('policy-result'(r6, [deny, ['prohibited-by', 'no-transfer-us']]))).
:- assertion(('policy-conflict'(r6, ['resolved-by', prohibit, 'no-transfer-us', [overrides, research]]))).
:- assertion(('policy-result'(r11, [deny, 'no-matching-permission']))).
:- assertion((\+ ('planned-duty'([baseline, r1], [delete, ['within-days', 90]])))).
