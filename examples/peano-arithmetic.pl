% Peano arithmetic example adapted from Eyelet input/peano.pl.
%
% This port keeps the arithmetic relational and rule-defined.  No new
% arithmetic built-ins are required: zero is 0 and successors are s(N).

peano_add(A, 0, A).
peano_add(A, s(B), s(C)) :-
  peano_add(A, B, C).

peano_multiply(_, 0, 0).
peano_multiply(A, s(B), C) :-
  peano_multiply(A, B, D),
  peano_add(A, D, C).

factorial(N, F) :-
  factorial_acc(N, s(0), F).

factorial_acc(0, Acc, Acc).
factorial_acc(s(N), Acc, F) :-
  peano_multiply(Acc, s(N), Next),
  factorial_acc(N, Next, F).

triple(peano_case, sum, Sum) :-
  peano_add(s(s(0)), s(s(s(0))), Sum).

triple(peano_case, product, Product) :-
  peano_multiply(s(s(0)), s(s(s(0))), Product).

triple(peano_case, factorial3, F) :-
  factorial(s(s(s(0))), F).
