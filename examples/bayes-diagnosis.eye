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
the factor of [first, [second, present]] is third
if the probability of [first, second] is third.

the factor of [first, [second, absent]] is 1 minus third
if the probability of [first, second] is third.

# Multiply all evidence factors, with 1 for an empty list.
the likelihood of [first, []] is 1 if first is a disease.
the likelihood of [first, [second | third]] is fourth times fifth
if the factor of [first, second] is fourth
and the likelihood of [first, third] is fifth.

# A disease's weight is its prior times the evidence likelihood for this case.
the score of [first, second] is third times fourth
if the prior of first is third
and the evidence of second is fifth
and the likelihood of [first, fifth] is fourth.

# Build the score list in the same order as the case's disease list.
the scores of [[], first] is [] if first is a patient-case.
the scores of [[first | second], third] is [fourth | fifth]
if the score of [first, third] is fourth
and the scores of [second, third] is fifth.

the sum of [] is 0.
the sum of [first | second] is first plus third if the sum of second is third.

if first is a patient-case
and the diseases of first is second
and the scores of [second, first] is third
then the scores of first is third.

if first is a patient-case
and the scores of first is second and the sum of second is third
then the evidence-total of first is third.

# Walk the candidates; normalize each score by the total for its own case.
if first is a patient-case and the diseases of first is second
then the candidates of first is second.
if the candidates of first is [second | third]
then the candidates of first is third.

if the candidates of first is [second | third]
and the score of [second, first] is fourth
and the evidence-total of first is fifth and fifth is greater than 0
then the posterior of [second, first] is fourth divided by fifth.

# Collect the posteriors in order so their sum can be checked.
the posteriors of [[], first] is [] if first is a patient-case.
the posteriors of [[first | second], third] is [fourth | fifth]
if the posterior of [first, third] is fourth
and the posteriors of [second, third] is fifth.

if first is a patient-case and the diseases of first is second
and the posteriors of [second, first] is third and the sum of third is fourth
then the posterior-total of first is fourth.

# Reject probabilities outside [0, 1], even when they are unused by this case.
if the prior of first is second and second is less than 0
then [prior, first] is an invalid-probability.
if the prior of first is second and second is greater than 1
then [prior, first] is an invalid-probability.
if the probability of first is second and second is less than 0
then [probability, first] is an invalid-probability.
if the probability of first is second and second is greater than 1
then [probability, first] is an invalid-probability.

if the evidence-total of first is second and second is greater than 0
then first is a normalizable-case.
if the posterior-total of first is second
and absolute value of (second minus 1) is at most 0.000000000001
then first is a normalized-case.

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
