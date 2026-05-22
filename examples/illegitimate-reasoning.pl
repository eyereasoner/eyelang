% Illegitimate reasoning detector.
%
% The input facts describe arguments and their surface reasoning pattern. Helper
% predicates identify common invalid inference forms. The output layer emits only
% concise report triples: the argument is illegitimate, which fallacy was found,
% the challenged conclusion, and a short reason why.

% Affirming the consequent:
%   If it rained, the street is wet. The street is wet. Therefore it rained.
argument(arg_affirming_consequent).
implication(arg_affirming_consequent, rain, street_wet).
observed(arg_affirming_consequent, street_wet).
concludes(arg_affirming_consequent, rain).

% Denying the antecedent:
%   If the key is present, the door opens. The key is not present. Therefore the door does not open.
argument(arg_denying_antecedent).
implication(arg_denying_antecedent, key_present, door_opens).
observed(arg_denying_antecedent, neg(key_present)).
concludes(arg_denying_antecedent, neg(door_opens)).

% Hasty generalization:
%   Three sampled cases are treated as enough for a universal conclusion.
argument(arg_hasty_generalization).
sample_size(arg_hasty_generalization, 3).
required_sample_size(arg_hasty_generalization, 30).
concludes(arg_hasty_generalization, all(crows, black)).

% False dilemma:
%   Only two choices are presented even though a relevant third option exists.
argument(arg_false_dilemma).
presented_alternatives(arg_false_dilemma, [approve_now, reject_forever]).
omitted_alternative(arg_false_dilemma, revise_proposal).
concludes(arg_false_dilemma, approve_now).

% A contrast case: modus ponens is not flagged.
argument(arg_modus_ponens).
implication(arg_modus_ponens, subscription_paid, access_allowed).
observed(arg_modus_ponens, subscription_paid).
concludes(arg_modus_ponens, access_allowed).

fallacy(A, affirming_consequent) :-
  argument(A),
  implication(A, Antecedent, Consequent),
  observed(A, Consequent),
  concludes(A, Antecedent).

fallacy(A, denying_antecedent) :-
  argument(A),
  implication(A, Antecedent, Consequent),
  observed(A, neg(Antecedent)),
  concludes(A, neg(Consequent)).

fallacy(A, hasty_generalization) :-
  argument(A),
  sample_size(A, N),
  required_sample_size(A, Min),
  lt(N, Min),
  concludes(A, all(_, _)).

fallacy(A, false_dilemma) :-
  argument(A),
  presented_alternatives(A, _),
  omitted_alternative(A, _),
  concludes(A, _).

reason(arg_affirming_consequent, "observing the consequent does not prove the antecedent").
reason(arg_denying_antecedent, "denying the antecedent does not disprove the consequent").
reason(arg_hasty_generalization, "sample size is below the threshold for a universal conclusion").
reason(arg_false_dilemma, "a relevant alternative is omitted").

triple(A, type, illegitimate_reasoning) :- fallacy(A, _).
triple(A, fallacy, F) :- fallacy(A, F).
triple(A, conclusion, C) :- fallacy(A, _), concludes(A, C).
triple(A, reason, R) :- fallacy(A, _), reason(A, R).
triple(A, sampleSize, N) :- fallacy(A, hasty_generalization), sample_size(A, N).
triple(A, requiredSampleSize, Min) :- fallacy(A, hasty_generalization), required_sample_size(A, Min).
triple(A, omittedAlternative, Alt) :- fallacy(A, false_dilemma), omitted_alternative(A, Alt).
