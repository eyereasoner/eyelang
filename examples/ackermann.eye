# Ackermann grows very quickly. Start with the questions below.
# Inputs are nonnegative whole numbers; [m, n] asks for A(m, n).
# A(m, n) = H(m, n + 3, 2) - 3, using the three-input helper below.
the ackermann of [first, second] is third minus 3
if first is at least 0 and second is at least 0
and the ackermann of [first, second plus 3, 2] is third.

# [level, count, base] builds successor, sum, product, power, then power towers.
the ackermann of [0, first, second] is first plus 1
if first is at least 0.

the ackermann of [1, first, second] is first plus second
if first is at least 0 and second is at least 0.

the ackermann of [2, first, second] is first times second
if first is at least 0 and second is at least 0.

# Use exact exponentiation directly, instead of repeated multiplication.
the ackermann of [3, first, second] is second to the power of first
if first is at least 0 and second is at least 0.

# Higher levels repeat the operation one level below them.
the ackermann of [first, 0, second] is 1
if first is greater than 3 and second is at least 0.

the ackermann of [first, second, third] is fourth
if first is greater than 3 and second is greater than 0 and third is at least 0
and the ackermann of [first, second minus 1, third] is fifth
and the ackermann of [first minus 1, fifth, third] is fourth.

# Answer
what is the ackermann of [0, 0]?
what is the ackermann of [0, 6]?
what is the ackermann of [1, 2]?
what is the ackermann of [1, 7]?
what is the ackermann of [2, 2]?
what is the ackermann of [2, 9]?
what is the ackermann of [3, 4]?
what is the ackermann of [3, 1000]?
what is the ackermann of [4, 0]?
what is the ackermann of [4, 1]?
what is the ackermann of [4, 2]?

# Reason: explain the large answer, sharing intermediate results.
why?

what is the ackermann of [5, 0]?
why?

# Check: known values, including exact powers for the two large answers.
check that the ackermann of [0, 0] is 1.
check that the ackermann of [0, 6] is 7.
check that the ackermann of [1, 2] is 4.
check that the ackermann of [1, 7] is 9.
check that the ackermann of [2, 2] is 7.
check that the ackermann of [2, 9] is 21.
check that the ackermann of [3, 4] is 125.
check that the ackermann of [3, 1000] is 2 to the power of 1003 minus 3.
check that the ackermann of [4, 0] is 13.
check that the ackermann of [4, 1] is 65533.
check that the ackermann of [4, 2] is 2 to the power of 65536 minus 3.
check that the ackermann of [5, 0] is 65533.
