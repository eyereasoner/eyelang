% SPEC 6, 7: definite clauses, conjunction, and recursive proof search.
parent(pat, jan).
parent(jan, emma).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
