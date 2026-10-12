# Deep taxonomy: 10 steps.
# ind starts with the label n0. Each step adds the next n label
# and two side labels, i and j. The last n label leads to a2.

ind is a n0.

if first is a n10 then first is an a2.
if first is a n0 then first is a n1.
if first is a n0 then first is an i1.
if first is a n0 then first is a j1.
if first is a n1 then first is a n2.
if first is a n1 then first is an i2.
if first is a n1 then first is a j2.
if first is a n2 then first is a n3.
if first is a n2 then first is an i3.
if first is a n2 then first is a j3.
if first is a n3 then first is a n4.
if first is a n3 then first is an i4.
if first is a n3 then first is a j4.
if first is a n4 then first is a n5.
if first is a n4 then first is an i5.
if first is a n4 then first is a j5.
if first is a n5 then first is a n6.
if first is a n5 then first is an i6.
if first is a n5 then first is a j6.
if first is a n6 then first is a n7.
if first is a n6 then first is an i7.
if first is a n6 then first is a j7.
if first is a n7 then first is a n8.
if first is a n7 then first is an i8.
if first is a n7 then first is a j8.
if first is a n8 then first is a n9.
if first is a n8 then first is an i9.
if first is a n8 then first is a j9.
if first is a n9 then first is a n10.
if first is a n9 then first is an i10.
if first is a n9 then first is a j10.

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
