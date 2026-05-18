% Basic recursive RDF bridge example.
triple(:jos, :parent, :jan).
triple(:jan, :parent, :lies).
triple(:lies, :parent, :emma).

triple(X, :ancestor, Y) :-
  triple(X, :parent, Y).

triple(X, :ancestor, Z) :-
  triple(X, :parent, Y),
  triple(Y, :ancestor, Z).
