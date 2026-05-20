% Takeuchi function example, adapted from Eyelet's input/takeuchi.pl.
%
% The recursive Tak function is intentionally expensive without caching.  The
% memoize declaration makes shared subcalls explicit while keeping the program
% ordinary Eyelog rules.

memoize(tak, 4).

tak(X, Y, Z, Z) :-
  le(X, Y).

tak(X, Y, Z, A) :-
  gt(X, Y),
  sub(X, 1, X1),
  tak(X1, Y, Z, A1),
  sub(Y, 1, Y1),
  tak(Y1, Z, X, A2),
  sub(Z, 1, Z1),
  tak(Z1, X, Y, A3),
  tak(A1, A2, A3, A).

case(classic, 34, 13, 8).
case(smaller, 12, 6, 0).

triple(Case, takeuchiInput, [X, Y, Z]) :-
  case(Case, X, Y, Z).

triple(Case, takeuchiResult, A) :-
  case(Case, X, Y, Z),
  tak(X, Y, Z, A).
