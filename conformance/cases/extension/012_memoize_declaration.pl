% SPEC 10.1: memoize/2 is a declaration and does not change answers.
memoize(reach, 2).
edge(a, b).
edge(b, c).
reach(X, Y) :- edge(X, Y).
reach(X, Z) :- edge(X, Y), reach(Y, Z).
