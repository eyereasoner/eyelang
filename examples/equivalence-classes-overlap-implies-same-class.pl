materialize(sameClassBecauseOfSharedMember, 3).

% Equivalence-classes example adapted from Eyeling
% equivalence-classes-overlap-implies-same-class.n3.
% The finite class membership facts represent the equivalence closure generated
% by b~a and b~c; the rule packages every shared-member witness.

classMember(class_abc, a).
classMember(class_abc, b).
classMember(class_abc, c).

inClassOf(U, X) :-
  classMember(Class, U),
  classMember(Class, X).

sameClass(X, Y) :-
  classMember(Class, X),
  classMember(Class, Y).

sameClassBecauseOfSharedMember(X, Y, Z) :-
  inClassOf(Z, X),
  inClassOf(Z, Y),
  sameClass(X, Y),
  neq(X, Y).
