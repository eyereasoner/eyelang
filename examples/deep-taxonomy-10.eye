# Deep taxonomy: 10 steps.
# ind starts with the label n0. Each step adds the next n label
# and two side labels, i and j. The last n label leads to a2.

ind is a n0.

if someone is a n10 then someone is an a2.
if someone is a n0 then someone is a n1.
if someone is a n0 then someone is an i1.
if someone is a n0 then someone is a j1.
if someone is a n1 then someone is a n2.
if someone is a n1 then someone is an i2.
if someone is a n1 then someone is a j2.
if someone is a n2 then someone is a n3.
if someone is a n2 then someone is an i3.
if someone is a n2 then someone is a j3.
if someone is a n3 then someone is a n4.
if someone is a n3 then someone is an i4.
if someone is a n3 then someone is a j4.
if someone is a n4 then someone is a n5.
if someone is a n4 then someone is an i5.
if someone is a n4 then someone is a j5.
if someone is a n5 then someone is a n6.
if someone is a n5 then someone is an i6.
if someone is a n5 then someone is a j6.
if someone is a n6 then someone is a n7.
if someone is a n6 then someone is an i7.
if someone is a n6 then someone is a j7.
if someone is a n7 then someone is a n8.
if someone is a n7 then someone is an i8.
if someone is a n7 then someone is a j8.
if someone is a n8 then someone is a n9.
if someone is a n8 then someone is an i9.
if someone is a n8 then someone is a j9.
if someone is a n9 then someone is a n10.
if someone is a n9 then someone is an i10.
if someone is a n9 then someone is a j10.

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
