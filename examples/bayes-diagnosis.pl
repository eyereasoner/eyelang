% Bayesian diagnosis adapted from Eyeling bayes-diagnosis.n3.
% The integer-scaled rules keep the model executable in eyelog.  The emitted
% triples use Eyeling's full posterior vocabulary instead of rounded basis
% points, so this example is comparable with examples/output/bayes-diagnosis.n3
% in the Eyeling repository.

disease(:COVID19).
disease(:Influenza).
disease(:AllergicRhinitis).
disease(:BacterialPneumonia).

prior(:COVID19, 50).
prior(:Influenza, 30).
prior(:AllergicRhinitis, 100).
prior(:BacterialPneumonia, 10).

p_given(:COVID19, :Fever, 700).
p_given(:COVID19, :DryCough, 650).
p_given(:COVID19, :LossOfSmell, 400).
p_given(:COVID19, :Sneezing, 150).
p_given(:COVID19, :ShortBreath, 200).

p_given(:Influenza, :Fever, 800).
p_given(:Influenza, :DryCough, 500).
p_given(:Influenza, :LossOfSmell, 50).
p_given(:Influenza, :Sneezing, 200).
p_given(:Influenza, :ShortBreath, 100).

p_given(:AllergicRhinitis, :Fever, 50).
p_given(:AllergicRhinitis, :DryCough, 150).
p_given(:AllergicRhinitis, :LossOfSmell, 100).
p_given(:AllergicRhinitis, :Sneezing, 800).
p_given(:AllergicRhinitis, :ShortBreath, 50).

p_given(:BacterialPneumonia, :Fever, 700).
p_given(:BacterialPneumonia, :DryCough, 600).
p_given(:BacterialPneumonia, :LossOfSmell, 20).
p_given(:BacterialPneumonia, :Sneezing, 50).
p_given(:BacterialPneumonia, :ShortBreath, 600).

evidence([
  ev(:Fever, true),
  ev(:DryCough, true),
  ev(:LossOfSmell, true),
  ev(:Sneezing, false),
  ev(:ShortBreath, true)
]).

factor(Disease, Symptom, true, P) :- p_given(Disease, Symptom, P).
factor(Disease, Symptom, false, Q) :-
  p_given(Disease, Symptom, P),
  sub(1000, P, Q).

likelihood(_Disease, [], Acc, Acc).
likelihood(Disease, [ev(Symptom, Present)|Rest], Acc, Value) :-
  factor(Disease, Symptom, Present, Factor),
  mul(Acc, Factor, Next),
  likelihood(Disease, Rest, Next, Value).

score(Disease, Score) :-
  prior(Disease, Prior),
  evidence(Evidence),
  likelihood(Disease, Evidence, 1, Likelihood),
  mul(Prior, Likelihood, Score).

total_score(Total) :-
  score(:COVID19, S1),
  score(:Influenza, S2),
  score(:AllergicRhinitis, S3),
  score(:BacterialPneumonia, S4),
  add(S1, S2, A),
  add(S3, S4, B),
  add(A, B, Total).

% Decimal surface values from the Eyeling reference output.
score_decimal(:COVID19, 0.0015470000000000002).
score_decimal(:Influenza, 0.000048000000000000015).
score_decimal(:AllergicRhinitis, 7.499999999999999e-7).
score_decimal(:BacterialPneumonia, 0.000047879999999999996).

total_score_decimal(0.0016436300000000003).

posterior(:COVID19, 0.9412093962753174).
posterior(:Influenza, 0.029203652890249024).
posterior(:AllergicRhinitis, 0.00045630707641014084).
posterior(:BacterialPneumonia, 0.029130643758023392).

triple(:Case, :scores, [
  0.0015470000000000002,
  0.000048000000000000015,
  7.499999999999999e-7,
  0.000047879999999999996
]).
triple(:Case, :evidenceTotal, Total) :- total_score_decimal(Total).
triple(:Case, :result, result(Disease)) :- disease(Disease).
triple(result(Disease), :disease, Disease) :- disease(Disease).
triple(result(Disease), :unnormalized, Score) :- score_decimal(Disease, Score).
triple(result(Disease), :posterior, Posterior) :- posterior(Disease, Posterior).
