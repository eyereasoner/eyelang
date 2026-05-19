% Floating-point arithmetic and comparisons.
% Integer-only operands continue to use arbitrary-size integer arithmetic.

sample(roomC, 21.5).
sample(targetC, 19.25).

triple(sum, value, X) :- add(1.5, 2.25, X).
triple(difference, value, X) :- sub(10.0, 3.125, X).
triple(product, value, X) :- mul(2.5, 4.0, X).
triple(quotient, value, X) :- div(7.5, 2, X).
triple(sqrtByPower, value, X) :- pow(9.0, 0.5, X).
triple(mathSum, value, X) :- add(0.125, 0.875, X).
triple(mathProduct, value, X) :- mul(6.0, 0.5, X).
triple(warmer, than, targetC) :- sample(roomC, R), sample(targetC, T), gt(R, T).
triple(comfortable, value, true) :- sample(roomC, R), ge(R, 21.0), le(R, 22.0).
