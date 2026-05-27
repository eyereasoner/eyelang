materialize(sameGreatestLowerBound, 4).

% Greatest-lower-bound uniqueness example adapted from Eyeling
% greatest-lower-bound-uniqueness.n3.
% If M and N are both greatest lower bounds of A and B, each is below the other;
% antisymmetry is represented by the ordinary derived relation sameTerm/2.

glbOf(g1, a, b).
glbOf(g2, a, b).

lowerBoundOf(M, A, B) :- glbOf(M, A, B).

leq(L, M) :-
  glbOf(M, A, B),
  lowerBoundOf(L, A, B).

sameTerm(M, N) :-
  leq(M, N),
  leq(N, M).

sameGreatestLowerBound(A, B, M, N) :-
  glbOf(M, A, B),
  glbOf(N, A, B),
  sameTerm(M, N),
  neq(M, N).
