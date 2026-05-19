% Complex numbers, adapted from Eyeling complex.n3.
%
% Complex values are represented as two-item lists [Real, Imaginary], matching
% the pair-shaped RDF lists used by the Eyeling source.

pi(3.141592653589793).
e(2.718281828459045).

complex:exponentiation([A, B], [C, D], [E, F]) :-
  complex:polar([A, B], [R, T]),
  math:exponentiation(R, C, Z1),
  math:negation(D, Z2),
  math:product(Z2, T, Z3),
  e(Euler),
  math:exponentiation(Euler, Z3, Z4),
  math:log(R, Z5),
  math:product(D, Z5, Z6),
  math:product(C, T, Z7),
  math:sum(Z6, Z7, Z8),
  math:cos(Z8, Z9),
  math:product(Z1, Z4, Z1Z4),
  math:product(Z1Z4, Z9, E),
  math:sin(Z8, Z10),
  math:product(Z1Z4, Z10, F).

complex:asin([A, B], [C, D]) :-
  math:sum(1, A, Z1),
  math:exponentiation(Z1, 2, Z2),
  math:exponentiation(B, 2, Z3),
  math:sum(Z2, Z3, Z4),
  math:exponentiation(Z4, 0.5, Z5),
  math:difference(1, A, Z6),
  math:exponentiation(Z6, 2, Z7),
  math:sum(Z7, Z3, Z8),
  math:exponentiation(Z8, 0.5, Z9),
  math:difference(Z5, Z9, Z10),
  math:quotient(Z10, 2, E),
  math:sum(Z5, Z9, Z11),
  math:quotient(Z11, 2, F),
  math:asin(E, C),
  math:exponentiation(F, 2, Z12),
  math:difference(Z12, 1, Z13),
  math:exponentiation(Z13, 0.5, Z14),
  math:sum(F, Z14, Z15),
  math:log(Z15, D).

complex:acos([A, B], [C, D]) :-
  math:sum(1, A, Z1),
  math:exponentiation(Z1, 2, Z2),
  math:exponentiation(B, 2, Z3),
  math:sum(Z2, Z3, Z4),
  math:exponentiation(Z4, 0.5, Z5),
  math:difference(1, A, Z6),
  math:exponentiation(Z6, 2, Z7),
  math:sum(Z7, Z3, Z8),
  math:exponentiation(Z8, 0.5, Z9),
  math:difference(Z5, Z9, Z10),
  math:quotient(Z10, 2, E),
  math:sum(Z5, Z9, Z11),
  math:quotient(Z11, 2, F),
  math:acos(E, C),
  math:exponentiation(F, 2, Z12),
  math:difference(Z12, 1, Z13),
  math:exponentiation(Z13, 0.5, Z14),
  math:sum(F, Z14, Z15),
  math:log(Z15, U),
  math:negation(U, D).

complex:polar([X, Y], [R, Tp]) :-
  math:exponentiation(X, 2, Z1),
  math:exponentiation(Y, 2, Z2),
  math:sum(Z1, Z2, Z3),
  math:exponentiation(Z3, 0.5, R),
  math:absoluteValue(X, Z4),
  math:quotient(Z4, R, Z5),
  math:acos(Z5, T),
  complex:dial(X, Y, T, Tp).

complex:dial(X, Y, T, Tp) :-
  math:notLessThan(X, 0),
  math:notLessThan(Y, 0),
  math:sum(0, T, Tp).

complex:dial(X, Y, T, Tp) :-
  math:lessThan(X, 0),
  math:notLessThan(Y, 0),
  pi(Pi),
  math:difference(Pi, T, Tp).

complex:dial(X, Y, T, Tp) :-
  math:lessThan(X, 0),
  math:lessThan(Y, 0),
  pi(Pi),
  math:sum(Pi, T, Tp).

complex:dial(X, Y, T, Tp) :-
  math:notLessThan(X, 0),
  math:lessThan(Y, 0),
  pi(Pi),
  math:product(Pi, 2, Z1),
  math:difference(Z1, T, Tp).

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
