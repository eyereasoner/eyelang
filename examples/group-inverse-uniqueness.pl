% Group inverse uniqueness, adapted from Eyeling's examples/group-inverse-uniqueness.n3.
%
% In a group, if B is a left inverse of A and C is a right inverse of A,
% then B and C are the same inverse. This finite instance records the result.

materialize(uniqueInverse, 2).
materialize(theorem, 1).

element(e).
element(a).
element(inv_a).

op(e, X, X) :- element(X).
op(X, e, X) :- element(X).
op(inv_a, a, e).
op(a, inv_a, e).

sameTerm(X, X) :- element(X).
sameTerm(X, Y) :-
  op(X, a, e),
  op(a, Y, e).

leftInverse(A, B) :- op(B, A, e).
rightInverse(A, B) :- op(A, B, e).

uniqueInverse(A, B) :-
  leftInverse(A, B),
  rightInverse(A, B).

theorem(group_inverse_unique) :-
  uniqueInverse(a, inv_a),
  sameTerm(inv_a, inv_a).
