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
the factor of [someone, [something, present]] is number
if the probability of [someone, something] is number.

the factor of [someone, [something, absent]] is 1 minus number
if the probability of [someone, something] is number.

# Multiply all evidence factors, with 1 for an empty list.
the likelihood of [someone, []] is 1 if someone is a disease.
the likelihood of [someone, [first | second]] is third times fourth
if the factor of [someone, first] is third
and the likelihood of [someone, second] is fourth.

# A disease's weight is its prior times the evidence likelihood for this case.
the score of [someone, something] is first times second
if the prior of someone is first
and the evidence of something is third
and the likelihood of [someone, third] is second.

# Build the score list in the same order as the case's disease list.
the scores of [[], someone] is [] if someone is a patient-case.
the scores of [[first | second], someone] is [third | fourth]
if the score of [first, someone] is third
and the scores of [second, someone] is fourth.

the sum of [] is 0.
the sum of [first | second] is first plus third if the sum of second is third.

if someone is a patient-case
and the diseases of someone is first
and the scores of [first, someone] is second
then the scores of someone is second.

if someone is a patient-case
and the scores of someone is first and the sum of first is second
then the evidence-total of someone is second.

# Walk the candidates; normalize each score by the total for its own case.
if someone is a patient-case and the diseases of someone is first
then the candidates of someone is first.
if the candidates of someone is [first | second]
then the candidates of someone is second.

if the candidates of someone is [first | second]
and the score of [first, someone] is third
and the evidence-total of someone is fourth and fourth is greater than 0
then the posterior of [first, someone] is third divided by fourth.

# Collect the posteriors in order so their sum can be checked.
the posteriors of [[], someone] is [] if someone is a patient-case.
the posteriors of [[first | second], someone] is [third | fourth]
if the posterior of [first, someone] is third
and the posteriors of [second, someone] is fourth.

if someone is a patient-case and the diseases of someone is first
and the posteriors of [first, someone] is second and the sum of second is third
then the posterior-total of someone is third.

# Reject probabilities outside [0, 1], even when they are unused by this case.
if the prior of someone is number and number is less than 0
then [prior, someone] is an invalid-probability.
if the prior of someone is number and number is greater than 1
then [prior, someone] is an invalid-probability.
if the probability of someone is number and number is less than 0
then [probability, someone] is an invalid-probability.
if the probability of someone is number and number is greater than 1
then [probability, someone] is an invalid-probability.

if the evidence-total of someone is number and number is greater than 0
then someone is a normalizable-case.
if the posterior-total of someone is number
and absolute value of (number minus 1) is at most 0.000000000001
then someone is a normalized-case.

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
