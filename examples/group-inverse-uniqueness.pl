% Group inverse uniqueness, adapted from Eyeling's examples/group-inverse-uniqueness.n3.
%
% The output mirrors the Eyeling golden result shape:
% sameInverse(x, i, j) and sameInverse(x, j, i).

materialize(sameInverse, 3).

element(e).
element(x).
element(i).
element(j).

op(e, X, X) :- element(X).
op(X, e, X) :- element(X).
op(i, x, e).
op(x, j, e).
op(j, x, e).
op(x, i, e).

sameTerm(X, X) :- element(X).
sameTerm(i, j).
sameTerm(j, i).

leftInverse(A, B) :- op(B, A, e).
rightInverse(A, B) :- op(A, B, e).

sameInverse(A, B, C) :-
  leftInverse(A, B),
  rightInverse(A, C),
  sameTerm(B, C),
  neq(B, C).
