% Proof by contrapositive example adapted from Eyelet input/proof-by-contrapositive.pl.
%
% The implication itself is represented as data with implies/2.  The proof
% rule remains ordinary Eyelog: if A implies B and B is false, then A is false.

implies(raining, wet_ground).
false(wet_ground).

false(A) :-
  implies(A, B),
  false(B).

triple(proof1, refutes, raining) :-
  false(raining).

triple(proof1, method, contrapositive) :-
  false(raining).

triple(proof1, reason, "if rain implies wet ground and the ground is not wet, then it is not raining") :-
  false(raining).
