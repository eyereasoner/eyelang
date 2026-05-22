% Peano arithmetic port from EYE reasoning/peano.
%
% The EYE example defines add, multiply and factorial over Peano numerals.
% Its query computes (1 * 2 + 3)! and emits the factorial of 5.

peano_add(A, 0, A).
peano_add(A, s(B), s(C)) :-
  peano_add(A, B, C).

peano_multiply(_A, 0, 0).
peano_multiply(A, s(B), C) :-
  peano_multiply(A, B, D),
  peano_add(A, D, C).

factorial(A, B) :-
  fac(A, s(0), B).

fac(0, A, A).
fac(s(A), B, C) :-
  peano_multiply(B, s(A), D),
  fac(A, D, C).

triple(B, factorial, C) :-
  peano_multiply(s(0), s(s(0)), A),
  peano_add(A, s(s(s(0))), B),
  factorial(B, C).
