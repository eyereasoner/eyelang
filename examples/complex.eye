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

the radius of ?number is square root of (?real times ?real plus ?imaginary times ?imaginary)
if the real of ?number is ?real and the imaginary of ?number is ?imaginary.

the angle of ?number is angle of ?real with ?imaginary
if the real of ?number is ?real and the imaginary of ?number is ?imaginary.

the log-radius of ?number is natural log of ?radius if the radius of ?number is ?radius.

# For a base with radius r and angle t, raised to c + d i:
# size = r to the power c, times exp of minus d times t.
# phase = d times log of r, plus c times t.
if ?power is a power
and the base of ?power is ?base and the exponent of ?power is ?exponent
and the radius of ?base is ?radius and the angle of ?base is ?angle
and the real of ?exponent is ?real and the imaginary of ?exponent is ?imaginary
then the size of ?power is (?radius to the power of ?real) times exponential of (0 minus ?imaginary times ?angle).

if ?power is a power
and the base of ?power is ?base and the exponent of ?power is ?exponent
and the log-radius of ?base is ?log-radius and the angle of ?base is ?angle
and the real of ?exponent is ?real and the imaginary of ?exponent is ?imaginary
then the phase of ?power is ?imaginary times ?log-radius plus ?real times ?angle.

if ?power is a power
and the size of ?power is ?size
and the phase of ?power is ?phase
then the real of ?power is ?size times cosine of ?phase.

if ?power is a power
and the size of ?power is ?size
and the phase of ?power is ?phase
then the imaginary of ?power is ?size times sine of ?phase.

# Apply both inverse functions to the input declared at the top.
asin-result is an inverse-sine.
the input of asin-result is input.
acos-result is an inverse-cosine.
the input of acos-result is input.

if ?function is an inverse-sine then ?function is an inverse-function.
if ?function is an inverse-cosine then ?function is an inverse-function.

# Measure the distances from minus one and plus one.
the left-distance of ?function is square root of ((1 plus ?real) to the power of 2 plus ?imaginary to the power of 2)
if the input of ?function is ?input
and the real of ?input is ?real
and the imaginary of ?input is ?imaginary.

the right-distance of ?function is square root of ((1 minus ?real) to the power of 2 plus ?imaginary to the power of 2)
if the input of ?function is ?input
and the real of ?input is ?real
and the imaginary of ?input is ?imaginary.

the difference of ?function is (?left minus ?right) divided by 2
if the left-distance of ?function is ?left and the right-distance of ?function is ?right.

the average of ?function is (?left plus ?right) divided by 2
if the left-distance of ?function is ?left and the right-distance of ?function is ?right.

the imaginary-size of ?function is natural log of (?average plus square root of (?average to the power of 2 minus 1))
if the average of ?function is ?average.

if ?function is an inverse-sine
and the difference of ?function is ?difference
then the real of ?function is arc sine of ?difference.

if ?function is an inverse-sine
and the imaginary-size of ?function is ?size
then the imaginary of ?function is ?size.

if ?function is an inverse-cosine
and the difference of ?function is ?difference
then the real of ?function is arc cosine of ?difference.

if ?function is an inverse-cosine
and the imaginary-size of ?function is ?size
then the imaginary of ?function is 0 minus ?size.

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
the hyperbolic-cosine of ?function is (exponential of ?imaginary plus exponential of (0 minus ?imaginary)) divided by 2
if the imaginary of ?function is ?imaginary.

the hyperbolic-sine of ?function is (exponential of ?imaginary minus exponential of (0 minus ?imaginary)) divided by 2
if the imaginary of ?function is ?imaginary.

if ?function is an inverse-sine and the real of ?function is ?real
and the hyperbolic-cosine of ?function is ?cosh
then the recovered-real of ?function is sine of ?real times ?cosh.

if ?function is an inverse-sine and the real of ?function is ?real
and the hyperbolic-sine of ?function is ?sinh
then the recovered-imaginary of ?function is cosine of ?real times ?sinh.

if ?function is an inverse-cosine and the real of ?function is ?real
and the hyperbolic-cosine of ?function is ?cosh
then the recovered-real of ?function is cosine of ?real times ?cosh.

if ?function is an inverse-cosine and the real of ?function is ?real
and the hyperbolic-sine of ?function is ?sinh
then the recovered-imaginary of ?function is 0 minus sine of ?real times ?sinh.

if the input of ?function is ?input
and the real of ?input is ?expected and the recovered-real of ?function is ?actual
then the real-error of ?function is absolute value of (?expected minus ?actual).

if the input of ?function is ?input
and the imaginary of ?input is ?expected and the recovered-imaginary of ?function is ?actual
then the imaginary-error of ?function is absolute value of (?expected minus ?actual).

if ?function is an inverse-function
and the real-error of ?function is ?real-error and ?real-error is at most 0.000000000001
and the imaginary-error of ?function is ?imaginary-error and ?imaginary-error is at most 0.000000000001
then ?function is a checked-inverse.

# Square the calculated square root and compare with the original base.
if the real of sqrt-minus-one is ?real and the imaginary of sqrt-minus-one is ?imaginary
then the squared-real of sqrt-minus-one is ?real times ?real minus ?imaginary times ?imaginary.

if the real of sqrt-minus-one is ?real and the imaginary of sqrt-minus-one is ?imaginary
then the squared-imaginary of sqrt-minus-one is 2 times ?real times ?imaginary.

if the squared-real of sqrt-minus-one is ?actual-real and the real of minus-one is ?expected-real
and absolute value of (?actual-real minus ?expected-real) is at most 0.000000000001
and the squared-imaginary of sqrt-minus-one is ?actual-imaginary and the imaginary of minus-one is ?expected-imaginary
and absolute value of (?actual-imaginary minus ?expected-imaginary) is at most 0.000000000001
then sqrt-minus-one is a checked-square-root.

# Euler's identity and the agreement of i^i with exp(-pi/2).
# Use a looser tolerance for the rounded exponent declared at the top.
if the real of e-to-i-pi is ?real and absolute value of (?real plus 1) is at most 0.000000000001
and the imaginary of e-to-i-pi is ?imaginary and absolute value of ?imaginary is at most 0.000000000001
then e-to-i-pi is a checked-identity.

if the real of i-to-i is ?actual-real and the real of e-to-minus-half-pi is ?expected-real
and absolute value of (?actual-real minus ?expected-real) is at most 0.0000000001
and the imaginary of i-to-i is ?actual-imaginary and absolute value of ?actual-imaginary is at most 0.000000000001
and the imaginary of e-to-minus-half-pi is ?expected-imaginary and absolute value of ?expected-imaginary is at most 0.000000000001
then i-to-i is a checked-identity.

check that sqrt-minus-one is a checked-square-root.
check that e-to-i-pi is a checked-identity.
check that i-to-i is a checked-identity.
check that asin-result is a checked-inverse.
check that acos-result is a checked-inverse.
