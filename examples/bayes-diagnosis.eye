# Bayes diagnosis: a toy model with illustrative probabilities, not real estimates.
# Treat the listed diseases as alternatives and symptoms as independent given a disease.
covid19 is a disease.
influenza is a disease.
allergic-rhinitis is a disease.
bacterial-pneumonia is a disease.

the prior of covid19 is 0.05.
the prior of influenza is 0.03.
the prior of allergic-rhinitis is 0.10.
the prior of bacterial-pneumonia is 0.01.

# Each pair means [disease, symptom]: P(symptom present given disease).
the probability of [covid19, fever] is 0.70.
the probability of [covid19, dry-cough] is 0.65.
the probability of [covid19, loss-of-smell] is 0.40.
the probability of [covid19, sneezing] is 0.15.
the probability of [covid19, short-breath] is 0.20.

the probability of [influenza, fever] is 0.80.
the probability of [influenza, dry-cough] is 0.50.
the probability of [influenza, loss-of-smell] is 0.05.
the probability of [influenza, sneezing] is 0.20.
the probability of [influenza, short-breath] is 0.10.

the probability of [allergic-rhinitis, fever] is 0.05.
the probability of [allergic-rhinitis, dry-cough] is 0.15.
the probability of [allergic-rhinitis, loss-of-smell] is 0.10.
the probability of [allergic-rhinitis, sneezing] is 0.80.
the probability of [allergic-rhinitis, short-breath] is 0.05.

the probability of [bacterial-pneumonia, fever] is 0.70.
the probability of [bacterial-pneumonia, dry-cough] is 0.60.
the probability of [bacterial-pneumonia, loss-of-smell] is 0.02.
the probability of [bacterial-pneumonia, sneezing] is 0.05.
the probability of [bacterial-pneumonia, short-breath] is 0.60.

case is a patient-case.
the diseases of case is [covid19, influenza, allergic-rhinitis, bacterial-pneumonia].
the evidence of case is [[fever, present], [dry-cough, present], [loss-of-smell, present], [sneezing, absent], [short-breath, present]].

# Present contributes p; observed absent contributes 1 - p.
# A symptom left out of the evidence contributes no factor.
the factor of [?disease, [?symptom, present]] is ?probability
if the probability of [?disease, ?symptom] is ?probability.

the factor of [?disease, [?symptom, absent]] is 1 minus ?probability
if the probability of [?disease, ?symptom] is ?probability.

# Multiply all evidence factors, with 1 for an empty list.
the likelihood of [?disease, []] is 1 if ?disease is a disease.
the likelihood of [?disease, [?observation | ?rest]] is ?factor times ?remaining
if the factor of [?disease, ?observation] is ?factor
and the likelihood of [?disease, ?rest] is ?remaining.

# A disease's weight is its prior times the evidence likelihood for this case.
the score of [?disease, ?case] is ?prior times ?likelihood
if the prior of ?disease is ?prior
and the evidence of ?case is ?evidence
and the likelihood of [?disease, ?evidence] is ?likelihood.

# Build the score list in the same order as the case's disease list.
the scores of [[], ?case] is [] if ?case is a patient-case.
the scores of [[?disease | ?rest], ?case] is [?score | ?remaining]
if the score of [?disease, ?case] is ?score
and the scores of [?rest, ?case] is ?remaining.

the sum of [] is 0.
the sum of [?value | ?rest] is ?value plus ?remaining if the sum of ?rest is ?remaining.

if ?case is a patient-case
and the diseases of ?case is ?diseases
and the scores of [?diseases, ?case] is ?scores
then the scores of ?case is ?scores.

if ?case is a patient-case
and the scores of ?case is ?scores and the sum of ?scores is ?total
then the evidence-total of ?case is ?total.

# Walk the candidates; normalize each score by the total for its own case.
if ?case is a patient-case and the diseases of ?case is ?diseases
then the candidates of ?case is ?diseases.
if the candidates of ?case is [?disease | ?rest]
then the candidates of ?case is ?rest.

if the candidates of ?case is [?disease | ?rest]
and the score of [?disease, ?case] is ?score
and the evidence-total of ?case is ?total and ?total is greater than 0
then the posterior of [?disease, ?case] is ?score divided by ?total.

# Collect the posteriors in order so their sum can be checked.
the posteriors of [[], ?case] is [] if ?case is a patient-case.
the posteriors of [[?disease | ?rest], ?case] is [?posterior | ?remaining]
if the posterior of [?disease, ?case] is ?posterior
and the posteriors of [?rest, ?case] is ?remaining.

if ?case is a patient-case and the diseases of ?case is ?diseases
and the posteriors of [?diseases, ?case] is ?posteriors and the sum of ?posteriors is ?total
then the posterior-total of ?case is ?total.

# Reject probabilities outside [0, 1], even when they are unused by this case.
if the prior of ?disease is ?probability and ?probability is less than 0
then [prior, ?disease] is an invalid-probability.
if the prior of ?disease is ?probability and ?probability is greater than 1
then [prior, ?disease] is an invalid-probability.
if the probability of ?pair is ?probability and ?probability is less than 0
then [probability, ?pair] is an invalid-probability.
if the probability of ?pair is ?probability and ?probability is greater than 1
then [probability, ?pair] is an invalid-probability.

if the evidence-total of ?case is ?total and ?total is greater than 0
then ?case is a normalizable-case.
if the posterior-total of ?case is ?total
and absolute value of (?total minus 1) is at most 0.000000000001
then ?case is a normalized-case.

# Answer
what is the scores of case?
what is the evidence-total of case?
what is the posterior of [covid19, case]?
what is the posterior of [influenza, case]?
what is the posterior of [allergic-rhinitis, case]?
what is the posterior of [bacterial-pneumonia, case]?

# Reason: trace the last posterior through its prior and every observation.
why?

# Check
check that there are 0 invalid-probabilities.
check that case is a normalizable-case.
check that case is a normalized-case.
