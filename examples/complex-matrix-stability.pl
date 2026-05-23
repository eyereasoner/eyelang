% 2x2 continuous-time stability check.
% For matrix [[a,b],[c,d]], a stable second-order linear system has
% trace < 0 and determinant > 0.  A negative discriminant indicates a
% complex-conjugate eigenvalue pair.

matrix(controller_loop, -0.7, 1.2, -0.4, -0.5).

trace(Matrix, Trace) :-
  matrix(Matrix, A, _B, _C, D),
  add(A, D, Trace).

determinant(Matrix, Determinant) :-
  matrix(Matrix, A, B, C, D),
  mul(A, D, AD),
  mul(B, C, BC),
  sub(AD, BC, Determinant).

discriminant(Matrix, Disc) :-
  trace(Matrix, T),
  determinant(Matrix, Det),
  mul(T, T, T2),
  mul(4, Det, FourDet),
  sub(T2, FourDet, Disc).

stable(Matrix) :-
  trace(Matrix, T),
  determinant(Matrix, Det),
  lt(T, 0),
  gt(Det, 0).

complex_pair(Matrix) :-
  discriminant(Matrix, Disc),
  lt(Disc, 0).

triple(Matrix, trace, T) :- trace(Matrix, T).
triple(Matrix, determinant, D) :- determinant(Matrix, D).
triple(Matrix, discriminant, D) :- discriminant(Matrix, D).
triple(Matrix, eigenShape, complex_conjugate_pair) :- complex_pair(Matrix).
triple(Matrix, status, asymptotically_stable) :- stable(Matrix).
