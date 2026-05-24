% Proof by contrapositive example adapted from Eyelet input/proof-by-contrapositive.pl.
%
% The implication itself is represented as data with implies/2.  The proof
% rule remains ordinary Eyelog: if A implies B and B is false, then A is false.

materialize(refutes, 2).
materialize(method, 2).
materialize(reason, 2).

implies(raining, wet_ground).
false(wet_ground).

false(A) :-
  implies(A, B),
  false(B).

refutes(proof1, raining) :-
  false(raining).

method(proof1, contrapositive) :-
  false(raining).

reason(proof1, "if rain implies wet ground and the ground is not wet, then it is not raining") :-
  false(raining).
