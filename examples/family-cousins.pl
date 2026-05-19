% Family-cousins derivation adapted from Eyeling family-cousins.n3.
% Generation numbers are derived from parent links; branch labels distinguish
% descendants of Bob from descendants of Carol.
% The family tree and seed branch labels are quoted as a small graph term, so
% the rules derive from scoped family data rather than global relationship facts.

family_graph(:FamilyGraph, graph([
  triple(:Adam, :parent, :Bob),
  triple(:Adam, :parent, :Carol),
  triple(:Bob, :parent, :Dave),
  triple(:Bob, :parent, :Eve),
  triple(:Carol, :parent, :Frank),
  triple(:Carol, :parent, :Grace),
  triple(:Dave, :parent, :Heidi),
  triple(:Eve, :parent, :Ivan),
  triple(:Frank, :parent, :Judy),
  triple(:Dave, :seedBranch, :b),
  triple(:Eve, :seedBranch, :b),
  triple(:Frank, :seedBranch, :c),
  triple(:Grace, :seedBranch, :c)
])).

graph_triple(graph(Statements), S, P, O) :- member(triple(S, P, O), Statements).
family_triple(S, P, O) :- family_graph(:FamilyGraph, Graph), graph_triple(Graph, S, P, O).

parent(Parent, Child) :- family_triple(Parent, :parent, Child).
branch(Person, Branch) :- family_triple(Person, :seedBranch, Branch).

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
