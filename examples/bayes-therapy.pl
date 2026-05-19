% Bayes therapy decision support adapted from Eyeling bayes-therapy.n3.
% Probabilities are illustrative and are not medical advice.
% The example combines a tiny Naive Bayes diagnosis model with a therapy
% utility layer: expected utility = 10 * expectedSuccess - 3 * expectedAdverse.

triple(:Case, :diseases, [:COVID19, :Influenza, :AllergicRhinitis, :BacterialPneumonia]).
triple(:Case, :therapies, [:Paxlovid, :Oseltamivir, :SupportiveCare, :Antibiotic, :Antihistamine]).
triple(:Case, :evidence, [
  ev(:Fever, true),
  ev(:DryCough, true),
  ev(:LossOfSmell, false),
  ev(:Sneezing, false),
  ev(:ShortBreath, false)
]).

prior(:COVID19, 0.05).
prior(:Influenza, 0.03).
prior(:AllergicRhinitis, 0.10).
prior(:BacterialPneumonia, 0.01).

p_given(:COVID19, :Fever, 0.70).
p_given(:COVID19, :DryCough, 0.65).
p_given(:COVID19, :LossOfSmell, 0.40).
p_given(:COVID19, :Sneezing, 0.15).
p_given(:COVID19, :ShortBreath, 0.20).

p_given(:Influenza, :Fever, 0.80).
p_given(:Influenza, :DryCough, 0.50).
p_given(:Influenza, :LossOfSmell, 0.05).
p_given(:Influenza, :Sneezing, 0.20).
p_given(:Influenza, :ShortBreath, 0.10).

p_given(:AllergicRhinitis, :Fever, 0.05).
p_given(:AllergicRhinitis, :DryCough, 0.15).
p_given(:AllergicRhinitis, :LossOfSmell, 0.10).
p_given(:AllergicRhinitis, :Sneezing, 0.80).
p_given(:AllergicRhinitis, :ShortBreath, 0.05).

p_given(:BacterialPneumonia, :Fever, 0.70).
p_given(:BacterialPneumonia, :DryCough, 0.60).
p_given(:BacterialPneumonia, :LossOfSmell, 0.02).
p_given(:BacterialPneumonia, :Sneezing, 0.05).
p_given(:BacterialPneumonia, :ShortBreath, 0.60).

therapy(:Paxlovid).
therapy(:Oseltamivir).
therapy(:Antihistamine).
therapy(:Antibiotic).
therapy(:SupportiveCare).

success_by_disease(:Paxlovid, [0.75, 0.05, 0.02, 0.05]).
success_by_disease(:Oseltamivir, [0.05, 0.60, 0.02, 0.05]).
success_by_disease(:Antihistamine, [0.10, 0.10, 0.75, 0.05]).
success_by_disease(:Antibiotic, [0.05, 0.05, 0.02, 0.80]).
success_by_disease(:SupportiveCare, [0.30, 0.30, 0.25, 0.20]).

adverse(:Paxlovid, 0.10).
adverse(:Oseltamivir, 0.08).
adverse(:Antihistamine, 0.03).
adverse(:Antibiotic, 0.07).
adverse(:SupportiveCare, 0.01).

benefit_weight(10).
harm_weight(3).

factor(Disease, ev(Symptom, true), P) :- p_given(Disease, Symptom, P).
factor(Disease, ev(Symptom, false), Q) :-
  p_given(Disease, Symptom, P),
  sub(1.0, P, Q).

likelihood(_Disease, [], 1.0).
likelihood(Disease, [Evidence|Rest], Likelihood) :-
  factor(Disease, Evidence, Factor),
  likelihood(Disease, Rest, TailLikelihood),
  mul(Factor, TailLikelihood, Likelihood).

score(Disease, Score) :-
  prior(Disease, Prior),
  triple(:Case, :evidence, Evidence),
  likelihood(Disease, Evidence, Likelihood),
  mul(Prior, Likelihood, Score).

scores_for([], []).
scores_for([Disease|RestDiseases], [Score|RestScores]) :-
  score(Disease, Score),
  scores_for(RestDiseases, RestScores).

sum_list([], 0.0).
sum_list([Value|Rest], Sum) :-
  sum_list(Rest, TailSum),
  add(Value, TailSum, Sum).

normalize_scores([], _Total, []).
normalize_scores([Score|RestScores], Total, [Posterior|RestPosteriors]) :-
  div(Score, Total, Posterior),
  normalize_scores(RestScores, Total, RestPosteriors).

disease_posterior([Disease|_RestDiseases], [Posterior|_RestPosteriors], Disease, Posterior).
disease_posterior([_OtherDisease|RestDiseases], [_OtherPosterior|RestPosteriors], Disease, Posterior) :-
  disease_posterior(RestDiseases, RestPosteriors, Disease, Posterior).

dot_product([], [], 0.0).
dot_product([Left|RestLeft], [Right|RestRight], Sum) :-
  mul(Left, Right, Term),
  dot_product(RestLeft, RestRight, TailSum),
  add(Term, TailSum, Sum).

expected_success(Therapy, ExpectedSuccess) :-
  triple(:Case, :posteriors, Posteriors),
  success_by_disease(Therapy, SuccessByDisease),
  dot_product(Posteriors, SuccessByDisease, ExpectedSuccess).

utility(Therapy, Utility) :-
  expected_success(Therapy, ExpectedSuccess),
  adverse(Therapy, Adverse),
  benefit_weight(BenefitWeight),
  harm_weight(HarmWeight),
  mul(BenefitWeight, ExpectedSuccess, Benefit),
  mul(HarmWeight, Adverse, HarmCost),
  sub(Benefit, HarmCost, Utility).

better_of(Therapy1, Therapy2, Therapy1) :-
  utility(Therapy1, Utility1),
  utility(Therapy2, Utility2),
  ge(Utility1, Utility2).
better_of(Therapy1, Therapy2, Therapy2) :-
  utility(Therapy1, Utility1),
  utility(Therapy2, Utility2),
  lt(Utility1, Utility2).

best_therapy([Therapy], Therapy).
best_therapy([Head, Next|Rest], Best) :-
  best_therapy([Next|Rest], BestRest),
  better_of(Head, BestRest, Best).

triple(:Case, :scores, Scores) :-
  triple(:Case, :diseases, Diseases),
  scores_for(Diseases, Scores).
triple(:Case, :evidenceTotal, Total) :-
  triple(:Case, :scores, Scores),
  sum_list(Scores, Total).
triple(:Case, :posteriors, Posteriors) :-
  triple(:Case, :scores, Scores),
  triple(:Case, :evidenceTotal, Total),
  normalize_scores(Scores, Total, Posteriors).
triple(Disease, :posterior, Posterior) :-
  triple(:Case, :diseases, Diseases),
  triple(:Case, :posteriors, Posteriors),
  disease_posterior(Diseases, Posteriors, Disease, Posterior).
triple(Therapy, :expectedSuccess, ExpectedSuccess) :-
  therapy(Therapy),
  expected_success(Therapy, ExpectedSuccess).
triple(Therapy, :expectedAdverse, Adverse) :-
  therapy(Therapy),
  adverse(Therapy, Adverse).
triple(Therapy, :utility, Utility) :-
  therapy(Therapy),
  utility(Therapy, Utility).
triple(:Case, :recommendedTherapy, Best) :-
  triple(:Case, :therapies, Therapies),
  best_therapy(Therapies, Best).
