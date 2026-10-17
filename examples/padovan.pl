% See https://en.wikipedia.org/wiki/Padovan_sequence


:- table padovan/2, padovan/5, plastic_ratio/2.

padovan(A, B) :-
    padovan(A, 0, 1, 1, B).

padovan(0, A, _, _, A).
padovan(1, _, A, _, A).
padovan(2, _, _, A, A).
padovan(A, B, C, D, E) :-
    A > 2,
    F is A-1,
    G is B+C,
    padovan(F, C, D, G, E).

plastic_ratio(A, B) :-
    padovan(A, C),
    D is A+1,
    padovan(D, E),
    B is E/C.

% query
% Answer and Reason
?- padovan(1, Value).
?- padovan(2, Value).
?- padovan(3, Value).
?- padovan(4, Value).
?- padovan(5, Value).
?- why.
?- padovan(91, Value).
?- padovan(283, Value).
?- padovan(3674, Value).
?- plastic_ratio(1, Ratio).
?- plastic_ratio(10, Ratio).
?- plastic_ratio(100, Ratio).
?- plastic_ratio(1000, Ratio).

% Check
:- assertion(padovan(0, 0)).
:- assertion(padovan(5, 2)).
:- assertion(padovan(91, 70748973084)).
:- assertion(padovan(283, 19834325738278984504790864536272129)).
:- assertion((padovan(3674, Value), padovan(3672, A), padovan(3671, B), Value =:= A + B)).
:- assertion((plastic_ratio(1000, Ratio), abs(Ratio - 1.324717957244746) < 1.0e-14)).
