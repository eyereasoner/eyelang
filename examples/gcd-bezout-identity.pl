% EYE reasoning-inspired example: greatest common divisor and Bézout identity.
%
% This ports the extended Euclidean algorithm idea into ordinary Eyelog rules.
% Each case derives gcd(a,b), coefficients s,t, and validation checks for
% a*s + b*t = gcd(a,b) and divisibility.

case(c1, 48, 18).
case(c2, 101, 462).
case(c3, 0, 5).
case(c4, 270, 192).
case(c5, -27, 36).
case(c6, 123456, 7890).

sign_and_abs(N, 1, N) :- ge(N, 0).
sign_and_abs(N, -1, Abs) :- lt(N, 0), neg(N, Abs).

initial_work(Case, A, B, AbsA, AbsB, SignA, SignB) :-
  case(Case, A, B),
  sign_and_abs(A, SignA, AbsA),
  sign_and_abs(B, SignB, AbsB).

work(Case, 0, AbsA, AbsB, 1, 0, 0, 1) :-
  initial_work(Case, A, B, AbsA, AbsB, SignA, SignB).

work(Case, Step, R1, R2, S1, S2, T1, T2) :-
  gt(Step, 0),
  sub(Step, 1, PrevStep),
  work(Case, PrevStep, R0, R1, S0, S1, T0, T1),
  neq(R1, 0),
  div(R0, R1, Q),
  mod(R0, R1, R2),
  mul(Q, S1, QS1),
  sub(S0, QS1, S2),
  mul(Q, T1, QT1),
  sub(T0, QT1, T2).

answer(Case, Gcd, S, T) :-
  between(0, 10, Step),
  work(Case, Step, Gcd, 0, S0, S1, T0, T1),
  initial_work(Case, A, B, AbsA, AbsB, SignA, SignB),
  mul(S0, SignA, S),
  mul(T0, SignB, T).

bezout_ok(Case) :-
  case(Case, A, B),
  answer(Case, Gcd, S, T),
  mul(A, S, AS),
  mul(B, T, BT),
  add(AS, BT, Gcd).

divides_ok(Case) :-
  case(Case, A, B),
  answer(Case, Gcd, S, T),
  mod(A, Gcd, 0),
  mod(B, Gcd, 0).

nonnegative_ok(Case) :-
  answer(Case, Gcd, S, T),
  ge(Gcd, 0).

triple(Case, gcd, Gcd) :- answer(Case, Gcd, S, T).
triple(Case, bezoutCoefficients, [S, T]) :- answer(Case, Gcd, S, T).
triple(Case, check, bezout_identity) :- bezout_ok(Case).
triple(Case, check, divides_inputs) :- divides_ok(Case).
triple(Case, check, nonnegative_gcd) :- nonnegative_ok(Case).
triple(Case, status, done) :- answer(Case, Gcd, S, T), bezout_ok(Case), divides_ok(Case), nonnegative_ok(Case).
