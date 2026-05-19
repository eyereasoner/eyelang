% Bayes therapy decision support adapted from Eyeling bayes-therapy.n3.
% Probabilities are illustrative and are not medical advice.
% The example combines a tiny Naive Bayes diagnosis model with a therapy
% utility layer: expected utility = 10 * expectedSuccess - 3 * expectedAdverse.

triple(case, diseases, [covid19, influenza, allergicRhinitis, bacterialPneumonia]).
triple(case, therapies, [paxlovid, oseltamivir, supportiveCare, antibiotic, antihistamine]).
triple(case, evidence, [
  ev(fever, true),
  ev(dryCough, true),
  ev(lossOfSmell, false),
  ev(sneezing, false),
  ev(shortBreath, false)
]).

prior(covid19, 0.05).
prior(influenza, 0.03).
prior(allergicRhinitis, 0.10).
prior(bacterialPneumonia, 0.01).

p_given(covid19, fever, 0.70).
p_given(covid19, dryCough, 0.65).
p_given(covid19, lossOfSmell, 0.40).
p_given(covid19, sneezing, 0.15).
p_given(covid19, shortBreath, 0.20).

p_given(influenza, fever, 0.80).
p_given(influenza, dryCough, 0.50).
p_given(influenza, lossOfSmell, 0.05).
p_given(influenza, sneezing, 0.20).
p_given(influenza, shortBreath, 0.10).

p_given(allergicRhinitis, fever, 0.05).
p_given(allergicRhinitis, dryCough, 0.15).
p_given(allergicRhinitis, lossOfSmell, 0.10).
p_given(allergicRhinitis, sneezing, 0.80).
p_given(allergicRhinitis, shortBreath, 0.05).

p_given(bacterialPneumonia, fever, 0.70).
p_given(bacterialPneumonia, dryCough, 0.60).
p_given(bacterialPneumonia, lossOfSmell, 0.02).
p_given(bacterialPneumonia, sneezing, 0.05).
p_given(bacterialPneumonia, shortBreath, 0.60).

therapy(paxlovid).
therapy(oseltamivir).
therapy(antihistamine).
therapy(antibiotic).
therapy(supportiveCare).

success_by_disease(paxlovid, [0.75, 0.05, 0.02, 0.05]).
success_by_disease(oseltamivir, [0.05, 0.60, 0.02, 0.05]).
success_by_disease(antihistamine, [0.10, 0.10, 0.75, 0.05]).
success_by_disease(antibiotic, [0.05, 0.05, 0.02, 0.80]).
success_by_disease(supportiveCare, [0.30, 0.30, 0.25, 0.20]).

adverse(paxlovid, 0.10).
adverse(oseltamivir, 0.08).
adverse(antihistamine, 0.03).
adverse(antibiotic, 0.07).
adverse(supportiveCare, 0.01).

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
  triple(case, evidence, Evidence),
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
  triple(case, posteriors, Posteriors),
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

triple(case, scores, Scores) :-
  triple(case, diseases, Diseases),
  scores_for(Diseases, Scores).
triple(case, evidenceTotal, Total) :-
  triple(case, scores, Scores),
  sum_list(Scores, Total).
triple(case, posteriors, Posteriors) :-
  triple(case, scores, Scores),
  triple(case, evidenceTotal, Total),
  normalize_scores(Scores, Total, Posteriors).
triple(Disease, posterior, Posterior) :-
  triple(case, diseases, Diseases),
  triple(case, posteriors, Posteriors),
  disease_posterior(Diseases, Posteriors, Disease, Posterior).
triple(Therapy, expectedSuccess, ExpectedSuccess) :-
  therapy(Therapy),
  expected_success(Therapy, ExpectedSuccess).
triple(Therapy, expectedAdverse, Adverse) :-
  therapy(Therapy),
  adverse(Therapy, Adverse).
triple(Therapy, utility, Utility) :-
  therapy(Therapy),
  utility(Therapy, Utility).
triple(case, recommendedTherapy, Best) :-
  triple(case, therapies, Therapies),
  best_therapy(Therapies, Best).
