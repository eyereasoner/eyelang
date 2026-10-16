% Enumerate paths in an acyclic weighted graph, then select minimum costs.
edge(a, b, 4).
edge(a, c, 2).
edge(c, b, 1).
edge(b, d, 3).
edge(c, d, 8).

path(X, Y, Cost) :-
    edge(X, Y, Cost).
path(X, Z, Cost) :-
    path(X, Y, Before),
    edge(Y, Z, Weight),
    Cost is Before + Weight.

cheaper(X, Y, Cost) :-
    path(X, Y, Other),
    Other < Cost.
shortest(X, Y, Cost) :-
    path(X, Y, Cost),
    \+ cheaper(X, Y, Cost).

% Answer and Reason
?- path(a, d, Cost).
?- shortest(a, d, Cost).
?- why.

% Check
:- assertion(path(a, d, 7)).
:- assertion(path(a, d, 10)).
:- assertion(path(a, d, 6)).
:- assertion(aggregate_all(count, path(a, d, Cost), 3)).
:- assertion(shortest(a, d, 6)).
:- assertion(shortest(a, b, 3)).
:- assertion(\+ shortest(a, d, 7)).
:- assertion(\+ shortest(a, d, 10)).
