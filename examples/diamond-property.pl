% Diamond property, adapted from Eyelet's input/diamond-property.pl.
%
% A relation has the diamond property when two outgoing steps from the same
% source can be joined again.  This compact Eyelog version keeps the same
% diamond idea and also checks that it is preserved by reflexive closure.

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

triple(diamondProperty, holdsFor, Rel) :- diamond(Rel, a, b, c, d).
triple(diamondProperty, commonSuccessor, D) :- diamond(r, a, b, c, D).
triple(diamondProperty, preservedUnderReflexiveClosure, true) :- diamond(re, a, b, c, d).
