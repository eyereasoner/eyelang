% Basic recursive relation example.
materialize(parent, 2).
materialize(ancestor, 2).

parent(pat, jan).
parent(jan, lies).
parent(lies, emma).

ancestor(X, Y) :-
  parent(X, Y).

ancestor(X, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
