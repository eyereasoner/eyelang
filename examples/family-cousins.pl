% Memoize scoped family projection and recursive labels; cousin derivation asks
% for the same generation and branch facts many times.
memoize(family_triple, 3).
memoize(generation, 2).
memoize(branch, 2).

% Family-cousins derivation adapted from Eyeling family-cousins.n3.
% Generation numbers are derived from parent links; branch labels distinguish
% descendants of Bob from descendants of Carol.
% The family tree and seed branch labels are quoted as a small formula term, so
% the rules derive from scoped family data rather than global relationship facts.

family_graph(familyGraph, (
  triple(adam, parent, bob),
  triple(adam, parent, carol),
  triple(bob, parent, dave),
  triple(bob, parent, eve),
  triple(carol, parent, frank),
  triple(carol, parent, grace),
  triple(dave, parent, heidi),
  triple(eve, parent, ivan),
  triple(frank, parent, judy),
  triple(dave, seedBranch, b),
  triple(eve, seedBranch, b),
  triple(frank, seedBranch, c),
  triple(grace, seedBranch, c)
)).

family_triple(S, P, O) :- family_graph(familyGraph, Formula), formula_triple(Formula, S, P, O).

parent(Parent, Child) :- family_triple(Parent, parent, Child).
branch(Person, Branch) :- family_triple(Person, seedBranch, Branch).

different(b, c).
different(c, b).

generation(adam, 0).
generation(Child, Next) :-
  parent(Parent, Child),
  generation(Parent, Gen),
  add(Gen, 1, Next).

branch(Child, Branch) :-
  parent(Parent, Child),
  branch(Parent, Branch).

derived_branch(Child, Branch) :-
  parent(Parent, Child),
  branch(Parent, Branch).

cousin(X, Y) :-
  generation(X, Gen),
  generation(Y, Gen),
  branch(X, BX),
  branch(Y, BY),
  different(BX, BY).

triple(Person, generation, Gen) :- generation(Person, Gen).
triple(Person, branch, Branch) :- derived_branch(Person, Branch).
triple(X, cousin, Y) :- cousin(X, Y).
