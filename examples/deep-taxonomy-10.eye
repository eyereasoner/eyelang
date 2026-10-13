# Deep taxonomy: 10 steps.
# ind starts with the label n0. Each step adds the next n label
# and two side labels, i and j. The last n label leads to a2.

ind is a n0.

if ?entity is a n10 then ?entity is an a2.
if ?entity is a n0 then ?entity is a n1.
if ?entity is a n0 then ?entity is an i1.
if ?entity is a n0 then ?entity is a j1.
if ?entity is a n1 then ?entity is a n2.
if ?entity is a n1 then ?entity is an i2.
if ?entity is a n1 then ?entity is a j2.
if ?entity is a n2 then ?entity is a n3.
if ?entity is a n2 then ?entity is an i3.
if ?entity is a n2 then ?entity is a j3.
if ?entity is a n3 then ?entity is a n4.
if ?entity is a n3 then ?entity is an i4.
if ?entity is a n3 then ?entity is a j4.
if ?entity is a n4 then ?entity is a n5.
if ?entity is a n4 then ?entity is an i5.
if ?entity is a n4 then ?entity is a j5.
if ?entity is a n5 then ?entity is a n6.
if ?entity is a n5 then ?entity is an i6.
if ?entity is a n5 then ?entity is a j6.
if ?entity is a n6 then ?entity is a n7.
if ?entity is a n6 then ?entity is an i7.
if ?entity is a n6 then ?entity is a j7.
if ?entity is a n7 then ?entity is a n8.
if ?entity is a n7 then ?entity is an i8.
if ?entity is a n7 then ?entity is a j8.
if ?entity is a n8 then ?entity is a n9.
if ?entity is a n8 then ?entity is an i9.
if ?entity is a n8 then ?entity is a j9.
if ?entity is a n9 then ?entity is a n10.
if ?entity is a n9 then ?entity is an i10.
if ?entity is a n9 then ?entity is a j10.

# Answer: did ind reach the final label?
who is an a2?

# Reason: every supporting step leading to a2.
why?

# Check: the terminal label and both final side branches must be present.
check that ind is an a2.
check that ind is a n10.
check that ind is an i10.
check that ind is a j10.
check that ind is not a n11.
