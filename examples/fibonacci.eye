# Fibonacci starts with 0 and 1.
the fibonacci of 0 is 0.
the fibonacci of 1 is 1.

# Work backwards from the number asked for. Reuse each answer once found.
the fibonacci of ?index is ?previous plus ?earlier
if ?index is greater than 1
and the fibonacci of ?index minus 1 is ?previous
and the fibonacci of ?index minus 2 is ?earlier.

# Answer: the first eleven Fibonacci numbers.
what is the fibonacci of 0?
what is the fibonacci of 1?
what is the fibonacci of 2?
what is the fibonacci of 3?
what is the fibonacci of 4?
what is the fibonacci of 5?
what is the fibonacci of 6?
what is the fibonacci of 7?
what is the fibonacci of 8?
what is the fibonacci of 9?
what is the fibonacci of 10?

# Reason: a small calculation shows how the recurrence works.
why is the fibonacci of 5 equal to 5?

# Ask for a larger answer using the same rule.
what is the fibonacci of 10000?

# Check: known values and Cassini's identity, a different mathematical relation.
# F(10000) * F(9998) - F(9999)^2 = -1 because 9999 is odd.
if the fibonacci of 10000 is ?current
and the fibonacci of 9998 is ?earlier
and the fibonacci of 9999 is ?previous
then the cassini of 10000 is ?current times ?earlier minus ?previous times ?previous.

check that the fibonacci of 0 is 0.
check that the fibonacci of 1 is 1.
check that the fibonacci of 10 is 55.
check that the fibonacci of 100 is 354224848179261915075.
check that the cassini of 10000 is -1.
