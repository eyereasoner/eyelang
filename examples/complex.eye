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

# Polar coordinates: distance from zero and angle in radians.
if someone is a power and the base of someone is something then something is a power-base.

if someone is a power-base
and the real of someone is first
and the imaginary of someone is second
then the radius of someone is square root of (first times first plus second times second).

if someone is a power-base
and the real of someone is first
and the imaginary of someone is second
then the angle of someone is angle of first with second.

if someone is a power-base
and the radius of someone is first
then the log-radius of someone is natural log of first.

# For a base with radius r and angle t, raised to c + d i:
# size = r to the power c, times exp of minus d times t.
# phase = d times log of r, plus c times t.
if someone is a power
and the base of someone is something
and the radius of something is first
and the exponent of someone is number
and the real of number is second
then the radial-power of someone is first to the power of second.

if someone is a power
and the base of someone is something
and the angle of something is first
and the exponent of someone is number
and the imaginary of number is second
then the damping of someone is exponential of (0 minus second times first).

if someone is a power
and the base of someone is something
and the log-radius of something is first
and the exponent of someone is number
and the imaginary of number is second
then the phase-imaginary of someone is second times first.

if someone is a power
and the base of someone is something
and the angle of something is first
and the exponent of someone is number
and the real of number is second
then the phase-real of someone is second times first.

if someone is a power
and the radial-power of someone is first
and the damping of someone is second
then the size of someone is first times second.

if someone is a power
and the phase-imaginary of someone is first
and the phase-real of someone is second
then the phase of someone is first plus second.

if someone is a power
and the size of someone is first
and the phase of someone is second
then the real of someone is first times cosine of second.

if someone is a power
and the size of someone is first
and the phase of someone is second
then the imaginary of someone is first times sine of second.

# Apply both inverse functions to the input declared at the top.
asin-result is an inverse-sine.
the input of asin-result is input.
acos-result is an inverse-cosine.
the input of acos-result is input.

if someone is an inverse-sine then someone is an inverse-function.
if someone is an inverse-cosine then someone is an inverse-function.

# Measure the distances from minus one and plus one.
if someone is an inverse-function
and the input of someone is something
and the real of something is first
and the imaginary of something is second
then the left-distance of someone is square root of ((1 plus first) to the power of 2 plus second to the power of 2).

if someone is an inverse-function
and the input of someone is something
and the real of something is first
and the imaginary of something is second
then the right-distance of someone is square root of ((1 minus first) to the power of 2 plus second to the power of 2).

if someone is an inverse-function
and the left-distance of someone is first
and the right-distance of someone is second
then the difference of someone is (first minus second) divided by 2.

if someone is an inverse-function
and the left-distance of someone is first
and the right-distance of someone is second
then the average of someone is (first plus second) divided by 2.

if someone is an inverse-function
and the average of someone is first
then the imaginary-size of someone is natural log of (first plus square root of (first to the power of 2 minus 1)).

if someone is an inverse-sine
and the difference of someone is first
then the real of someone is arc sine of first.

if someone is an inverse-sine
and the imaginary-size of someone is first
then the imaginary of someone is first.

if someone is an inverse-cosine
and the difference of someone is first
then the real of someone is arc cosine of first.

if someone is an inverse-cosine
and the imaginary-size of someone is first
then the imaginary of someone is 0 minus first.

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
if someone is an inverse-function and the imaginary of someone is first
then the hyperbolic-cosine of someone is (exponential of first plus exponential of (0 minus first)) divided by 2.

if someone is an inverse-function and the imaginary of someone is first
then the hyperbolic-sine of someone is (exponential of first minus exponential of (0 minus first)) divided by 2.

if someone is an inverse-sine and the real of someone is first
and the hyperbolic-cosine of someone is second
then the recovered-real of someone is sine of first times second.

if someone is an inverse-sine and the real of someone is first
and the hyperbolic-sine of someone is second
then the recovered-imaginary of someone is cosine of first times second.

if someone is an inverse-cosine and the real of someone is first
and the hyperbolic-cosine of someone is second
then the recovered-real of someone is cosine of first times second.

if someone is an inverse-cosine and the real of someone is first
and the hyperbolic-sine of someone is second
then the recovered-imaginary of someone is 0 minus sine of first times second.

if the input of someone is something
and the real of something is first and the recovered-real of someone is second
then the real-error of someone is absolute value of (first minus second).

if the input of someone is something
and the imaginary of something is first and the recovered-imaginary of someone is second
then the imaginary-error of someone is absolute value of (first minus second).

if someone is an inverse-function
and the real-error of someone is first and first is at most 0.000000000001
and the imaginary-error of someone is second and second is at most 0.000000000001
then someone is a checked-inverse.

# Square the calculated square root and compare with the original base.
if the real of sqrt-minus-one is first and the imaginary of sqrt-minus-one is second
then the squared-real of sqrt-minus-one is first times first minus second times second.

if the real of sqrt-minus-one is first and the imaginary of sqrt-minus-one is second
then the squared-imaginary of sqrt-minus-one is 2 times first times second.

if the squared-real of sqrt-minus-one is first and the real of minus-one is second
and absolute value of (first minus second) is at most 0.000000000001
and the squared-imaginary of sqrt-minus-one is number and the imaginary of minus-one is something
and absolute value of (number minus something) is at most 0.000000000001
then sqrt-minus-one is a checked-square-root.

# Euler's identity and the agreement of i^i with exp(-pi/2).
# Use a looser tolerance for the rounded exponent declared at the top.
if the real of e-to-i-pi is first and absolute value of (first plus 1) is at most 0.000000000001
and the imaginary of e-to-i-pi is second and absolute value of second is at most 0.000000000001
then e-to-i-pi is a checked-identity.

if the real of i-to-i is first and the real of e-to-minus-half-pi is second
and absolute value of (first minus second) is at most 0.0000000001
and the imaginary of i-to-i is number and absolute value of number is at most 0.000000000001
and the imaginary of e-to-minus-half-pi is something and absolute value of something is at most 0.000000000001
then i-to-i is a checked-identity.

check that sqrt-minus-one is a checked-square-root.
check that e-to-i-pi is a checked-identity.
check that i-to-i is a checked-identity.
check that asin-result is a checked-inverse.
check that acos-result is a checked-inverse.
