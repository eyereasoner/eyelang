# A complex number has a real part and an imaginary part.
# Calculate asin(5.22) and acos(5.22). Change the real input to try another value.
input is a complex-number.
the real of input is 5.22.
the imaginary of input is 0.

# The imaginary unit i is the square root of minus one.
minus-one is a complex-number.
the real of minus-one is -1.
the imaginary of minus-one is 0.

half is a complex-number.
the real of half is 0.5.
the imaginary of half is 0.

euler is a complex-number.
the real of euler is 2.718281828459045.
the imaginary of euler is 0.

i is a complex-number.
the real of i is 0.
the imaginary of i is 1.

i-pi is a complex-number.
the real of i-pi is 0.
the imaginary of i-pi is 3.141592653589793.

# This exponent is a rounded value of minus pi divided by two.
minus-half-pi is a complex-number.
the real of minus-half-pi is -1.57079632679.
the imaginary of minus-half-pi is 0.

# Four powers to work out.
sqrt-minus-one is a power.
the base of sqrt-minus-one is minus-one.
the exponent of sqrt-minus-one is half.

e-to-i-pi is a power.
the base of e-to-i-pi is euler.
the exponent of e-to-i-pi is i-pi.

i-to-i is a power.
the base of i-to-i is i.
the exponent of i-to-i is i.

e-to-minus-half-pi is a power.
the base of e-to-minus-half-pi is euler.
the exponent of e-to-minus-half-pi is minus-half-pi.

# Work out polar coordinates when another calculation asks for them.

the radius of first is square root of (second times second plus third times third)
if the real of first is second and the imaginary of first is third.

the angle of first is angle of second with third
if the real of first is second and the imaginary of first is third.

the log-radius of first is natural log of second if the radius of first is second.

# For a base with radius r and angle t, raised to c + d i:
# size = r to the power c, times exp of minus d times t.
# phase = d times log of r, plus c times t.
if first is a power
and the base of first is second and the exponent of first is third
and the radius of second is fourth and the angle of second is fifth
and the real of third is sixth and the imaginary of third is seventh
then the size of first is (fourth to the power of sixth) times exponential of (0 minus seventh times fifth).

if first is a power
and the base of first is second and the exponent of first is third
and the log-radius of second is fourth and the angle of second is fifth
and the real of third is sixth and the imaginary of third is seventh
then the phase of first is seventh times fourth plus sixth times fifth.

if first is a power
and the size of first is second
and the phase of first is third
then the real of first is second times cosine of third.

if first is a power
and the size of first is second
and the phase of first is third
then the imaginary of first is second times sine of third.

# Apply both inverse functions to the input declared at the top.
asin-result is an inverse-sine.
the input of asin-result is input.
acos-result is an inverse-cosine.
the input of acos-result is input.

if first is an inverse-sine then first is an inverse-function.
if first is an inverse-cosine then first is an inverse-function.

# Measure the distances from minus one and plus one.
the left-distance of first is square root of ((1 plus second) to the power of 2 plus third to the power of 2)
if the input of first is fourth
and the real of fourth is second
and the imaginary of fourth is third.

the right-distance of first is square root of ((1 minus second) to the power of 2 plus third to the power of 2)
if the input of first is fourth
and the real of fourth is second
and the imaginary of fourth is third.

the difference of first is (second minus third) divided by 2
if the left-distance of first is second and the right-distance of first is third.

the average of first is (second plus third) divided by 2
if the left-distance of first is second and the right-distance of first is third.

the imaginary-size of first is natural log of (second plus square root of (second to the power of 2 minus 1))
if the average of first is second.

if first is an inverse-sine
and the difference of first is second
then the real of first is arc sine of second.

if first is an inverse-sine
and the imaginary-size of first is second
then the imaginary of first is second.

if first is an inverse-cosine
and the difference of first is second
then the real of first is arc cosine of second.

if first is an inverse-cosine
and the imaginary-size of first is second
then the imaginary of first is 0 minus second.

# Answer: read each result as its real part plus its imaginary part times i.
what is the real of sqrt-minus-one?
what is the imaginary of sqrt-minus-one?
what is the real of e-to-i-pi?
what is the imaginary of e-to-i-pi?
what is the real of i-to-i?
what is the imaginary of i-to-i?
what is the real of e-to-minus-half-pi?
what is the imaginary of e-to-minus-half-pi?
what is the real of asin-result?
what is the imaginary of asin-result?
what is the real of acos-result?
what is the imaginary of acos-result?

# Reason: follow the inverse cosine calculation back to the input.
why?

# Check: apply sine or cosine to each inverse result to recover the input.
# cosh(b) = (exp(b) + exp(-b)) / 2; sinh(b) = (exp(b) - exp(-b)) / 2.
the hyperbolic-cosine of first is (exponential of second plus exponential of (0 minus second)) divided by 2
if the imaginary of first is second.

the hyperbolic-sine of first is (exponential of second minus exponential of (0 minus second)) divided by 2
if the imaginary of first is second.

if first is an inverse-sine and the real of first is second
and the hyperbolic-cosine of first is third
then the recovered-real of first is sine of second times third.

if first is an inverse-sine and the real of first is second
and the hyperbolic-sine of first is third
then the recovered-imaginary of first is cosine of second times third.

if first is an inverse-cosine and the real of first is second
and the hyperbolic-cosine of first is third
then the recovered-real of first is cosine of second times third.

if first is an inverse-cosine and the real of first is second
and the hyperbolic-sine of first is third
then the recovered-imaginary of first is 0 minus sine of second times third.

if the input of first is second
and the real of second is third and the recovered-real of first is fourth
then the real-error of first is absolute value of (third minus fourth).

if the input of first is second
and the imaginary of second is third and the recovered-imaginary of first is fourth
then the imaginary-error of first is absolute value of (third minus fourth).

if first is an inverse-function
and the real-error of first is second and second is at most 0.000000000001
and the imaginary-error of first is third and third is at most 0.000000000001
then first is a checked-inverse.

# Square the calculated square root and compare with the original base.
if the real of sqrt-minus-one is first and the imaginary of sqrt-minus-one is second
then the squared-real of sqrt-minus-one is first times first minus second times second.

if the real of sqrt-minus-one is first and the imaginary of sqrt-minus-one is second
then the squared-imaginary of sqrt-minus-one is 2 times first times second.

if the squared-real of sqrt-minus-one is first and the real of minus-one is second
and absolute value of (first minus second) is at most 0.000000000001
and the squared-imaginary of sqrt-minus-one is third and the imaginary of minus-one is fourth
and absolute value of (third minus fourth) is at most 0.000000000001
then sqrt-minus-one is a checked-square-root.

# Euler's identity and the agreement of i^i with exp(-pi/2).
# Use a looser tolerance for the rounded exponent declared at the top.
if the real of e-to-i-pi is first and absolute value of (first plus 1) is at most 0.000000000001
and the imaginary of e-to-i-pi is second and absolute value of second is at most 0.000000000001
then e-to-i-pi is a checked-identity.

if the real of i-to-i is first and the real of e-to-minus-half-pi is second
and absolute value of (first minus second) is at most 0.0000000001
and the imaginary of i-to-i is third and absolute value of third is at most 0.000000000001
and the imaginary of e-to-minus-half-pi is fourth and absolute value of fourth is at most 0.000000000001
then i-to-i is a checked-identity.

check that sqrt-minus-one is a checked-square-root.
check that e-to-i-pi is a checked-identity.
check that i-to-i is a checked-identity.
check that asin-result is a checked-inverse.
check that acos-result is a checked-inverse.
