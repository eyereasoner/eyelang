% Define list operations with ordinary recursive clauses.
% Supply finite lists; tabling keeps recursive constructors demand-driven.
:- table append/3, squares/2, sum/2.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

squares([], []).
squares([X | Xs], [Y | Ys]) :-
    Y is X * X,
    squares(Xs, Ys).

sum([], 0).
sum([X | Xs], Total) :-
    sum(Xs, Rest),
    Total is X + Rest.

% Answer and Reason
?- append([a, b], [c, d], Joined).
?- why.
?- squares([1, 2, 3, 4], Squared).
?- why.
?- sum([1, 2, 3, 4], Total).
?- why.

% Check
:- assertion(append([a, b], [c, d], [a, b, c, d])).
:- assertion(squares([1, 2, 3, 4], [1, 4, 9, 16])).
:- assertion(sum([1, 2, 3, 4], 10)).
:- assertion(append([], [a], [a])).
:- assertion(squares([], [])).
:- assertion(sum([], 0)).
