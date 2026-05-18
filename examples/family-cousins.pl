% Family-cousins derivation adapted from Eyeling family-cousins.n3.
% Generation numbers are derived from parent links; branch labels distinguish
% descendants of Bob from descendants of Carol.

parent(:Adam, :Bob).
parent(:Adam, :Carol).
parent(:Bob, :Dave).
parent(:Bob, :Eve).
parent(:Carol, :Frank).
parent(:Carol, :Grace).
parent(:Dave, :Heidi).
parent(:Eve, :Ivan).
parent(:Frank, :Judy).

branch(:Dave, :b).
branch(:Eve, :b).
branch(:Frank, :c).
branch(:Grace, :c).

different(:b, :c).
different(:c, :b).

generation(:Adam, 0).
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

triple(Person, :generation, Gen) :- generation(Person, Gen).
triple(Person, :branch, Branch) :- derived_branch(Person, Branch).
triple(X, :cousin, Y) :- cousin(X, Y).
