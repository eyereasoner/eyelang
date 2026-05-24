% Law of cosines: c^2 = a^2 + b^2 - 2ab cos(C).
% The example uses a 60-degree included angle, so cos(C) is represented as 0.5.

materialize(sideCSquared, 2).
materialize(sideC, 2).
materialize(status, 2).

triangle(tri60, 7, 9, 0.5).

side_c_squared(Triangle, C2) :-
  triangle(Triangle, A, B, CosC),
  mul(A, A, A2),
  mul(B, B, B2),
  add(A2, B2, Sum),
  mul(2, A, TwoA),
  mul(TwoA, B, TwoAB),
  mul(TwoAB, CosC, Projection),
  sub(Sum, Projection, C2).

side_c(Triangle, C) :-
  side_c_squared(Triangle, C2),
  pow(C2, 0.5, C).

sideCSquared(Triangle, C2) :- side_c_squared(Triangle, C2).
sideC(Triangle, C) :- side_c(Triangle, C).
status(Triangle, acute_triangle) :- side_c_squared(Triangle, C2), gt(C2, 0).
