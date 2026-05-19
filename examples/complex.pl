% Complex numbers, adapted from Eyeling complex.n3.
%
% Complex values are represented as two-item lists [Real, Imaginary], matching
% the pair-shaped RDF lists used by the Eyeling source.

pi(3.141592653589793).
e(2.718281828459045).

complex:exponentiation([A, B], [C, D], [E, F]) :-
  complex:polar([A, B], [R, T]),
  pow(R, C, Z1),
  neg(D, Z2),
  mul(Z2, T, Z3),
  e(Euler),
  pow(Euler, Z3, Z4),
  log(R, Z5),
  mul(D, Z5, Z6),
  mul(C, T, Z7),
  add(Z6, Z7, Z8),
  cos(Z8, Z9),
  mul(Z1, Z4, Z1Z4),
  mul(Z1Z4, Z9, E),
  sin(Z8, Z10),
  mul(Z1Z4, Z10, F).

complex:asin([A, B], [C, D]) :-
  add(1, A, Z1),
  pow(Z1, 2, Z2),
  pow(B, 2, Z3),
  add(Z2, Z3, Z4),
  pow(Z4, 0.5, Z5),
  sub(1, A, Z6),
  pow(Z6, 2, Z7),
  add(Z7, Z3, Z8),
  pow(Z8, 0.5, Z9),
  sub(Z5, Z9, Z10),
  div(Z10, 2, E),
  add(Z5, Z9, Z11),
  div(Z11, 2, F),
  asin(E, C),
  pow(F, 2, Z12),
  sub(Z12, 1, Z13),
  pow(Z13, 0.5, Z14),
  add(F, Z14, Z15),
  log(Z15, D).

complex:acos([A, B], [C, D]) :-
  add(1, A, Z1),
  pow(Z1, 2, Z2),
  pow(B, 2, Z3),
  add(Z2, Z3, Z4),
  pow(Z4, 0.5, Z5),
  sub(1, A, Z6),
  pow(Z6, 2, Z7),
  add(Z7, Z3, Z8),
  pow(Z8, 0.5, Z9),
  sub(Z5, Z9, Z10),
  div(Z10, 2, E),
  add(Z5, Z9, Z11),
  div(Z11, 2, F),
  acos(E, C),
  pow(F, 2, Z12),
  sub(Z12, 1, Z13),
  pow(Z13, 0.5, Z14),
  add(F, Z14, Z15),
  log(Z15, U),
  neg(U, D).

complex:polar([X, Y], [R, Tp]) :-
  pow(X, 2, Z1),
  pow(Y, 2, Z2),
  add(Z1, Z2, Z3),
  pow(Z3, 0.5, R),
  abs(X, Z4),
  div(Z4, R, Z5),
  acos(Z5, T),
  complex:dial(X, Y, T, Tp).

complex:dial(X, Y, T, Tp) :-
  ge(X, 0),
  ge(Y, 0),
  add(0, T, Tp).

complex:dial(X, Y, T, Tp) :-
  lt(X, 0),
  ge(Y, 0),
  pi(Pi),
  sub(Pi, T, Tp).

complex:dial(X, Y, T, Tp) :-
  lt(X, 0),
  lt(Y, 0),
  pi(Pi),
  add(Pi, T, Tp).

complex:dial(X, Y, T, Tp) :-
  ge(X, 0),
  lt(Y, 0),
  pi(Pi),
  mul(Pi, 2, Z1),
  sub(Z1, T, Tp).

triple(:test, :is, (
  triple(input(exponentiation, [-1, 0], [0.5, 0]), complex:exponentiation, C1),
  triple(input(exponentiation, [2.718281828459045, 0], [0, 3.141592653589793]), complex:exponentiation, C2),
  triple(input(exponentiation, [0, 1], [0, 1]), complex:exponentiation, C3),
  triple(input(exponentiation, [2.718281828459045, 0], [-1.57079632679, 0]), complex:exponentiation, C4),
  triple(input(asin, [2, 0]), complex:asin, C5),
  triple(input(acos, [2, 0]), complex:acos, C6)
)) :-
  complex:exponentiation([-1, 0], [0.5, 0], C1),
  complex:exponentiation([2.718281828459045, 0], [0, 3.141592653589793], C2),
  complex:exponentiation([0, 1], [0, 1], C3),
  complex:exponentiation([2.718281828459045, 0], [-1.57079632679, 0], C4),
  complex:asin([2, 0], C5),
  complex:acos([2, 0], C6).
