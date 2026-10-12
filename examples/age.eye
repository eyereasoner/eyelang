# Is Pat older than 80 years?
# Pat was born on 21 August 1944.
the birthday of pat-h is [1944, 8, 21].

# Compare on 12 October 2026. Change these facts to try another date.
the date of today is [2026, 10, 12].

the person of test is pat-h.
the age-limit of test is 80.

# Work backwards from the person and the number of years asked about.
# A larger year difference is enough, even before this year's birthday.
first is-older-than second
if the birthday of first is [third, fourth, fifth]
and the date of today is [sixth, seventh, eighth]
and sixth minus third is greater than second.

# With the same year difference, the birthday must have passed.
# On the birthday itself, the person is exactly that old, not older.
first is-older-than second
if the birthday of first is [third, fourth, fifth]
and the date of today is [sixth, seventh, eighth]
and sixth minus third is equal to second
and seventh is greater than fourth.

first is-older-than second
if the birthday of first is [third, fourth, fifth]
and the date of today is [sixth, seventh, eighth]
and sixth minus third is equal to second
and seventh is equal to fourth
and eighth is greater than fifth.

if the person of test is first
and the age-limit of test is second
and first is-older-than second
then test is a passed-check.

# Answer and Reason: find who qualifies, then explain the test result.
who is-older-than 80?
is test a passed-check?
why?

# Check: the limit is strict, and the supplied date is after Pat's birthday.
check that pat-h is-older-than 80.
check that pat-h is-older-than 82.
check that not pat-h is-older-than 83.
check that test is a passed-check.
check that there is 1 passed-check.
