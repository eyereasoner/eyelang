% Diamond property, adapted from Eyelet's input/diamond-property.pl.
%
% A relation has the diamond property when two outgoing steps from the same
% source can be joined again.  This compact eyelang version keeps the same
% diamond idea and also checks that it is preserved by reflexive closure.

materialize(holdsFor, 2).
materialize(commonSuccessor, 2).
materialize(preservedUnderReflexiveClosure, 2).

node(a).
node(b).
node(c).
node(d).

r(a, b).
r(a, c).
r(b, d).
r(c, d).

re(X, X) :- node(X).
re(X, Y) :- r(X, Y).

diamond(Rel, A, B, C, D) :-
  step(Rel, A, B),
  step(Rel, A, C),
  step(Rel, B, D),
  step(Rel, C, D).

step(r, X, Y) :- r(X, Y).
step(re, X, Y) :- re(X, Y).

holdsFor(diamondProperty, Rel) :- diamond(Rel, a, b, c, d).
commonSuccessor(diamondProperty, D) :- diamond(r, a, b, c, D).
preservedUnderReflexiveClosure(diamondProperty, true) :- diamond(re, a, b, c, d).
