% Deep taxonomy: 10 steps.
% ind starts with the label n0. Each step adds the next n label
% and two side labels, i and j. The last n label leads to a2.

% Prolog facts and rules.
is_a(ind, n0).

is_a(Entity, a2) :-
    is_a(Entity, n10).
is_a(Entity, n1) :-
    is_a(Entity, n0).
is_a(Entity, i1) :-
    is_a(Entity, n0).
is_a(Entity, j1) :-
    is_a(Entity, n0).
is_a(Entity, n2) :-
    is_a(Entity, n1).
is_a(Entity, i2) :-
    is_a(Entity, n1).
is_a(Entity, j2) :-
    is_a(Entity, n1).
is_a(Entity, n3) :-
    is_a(Entity, n2).
is_a(Entity, i3) :-
    is_a(Entity, n2).
is_a(Entity, j3) :-
    is_a(Entity, n2).
is_a(Entity, n4) :-
    is_a(Entity, n3).
is_a(Entity, i4) :-
    is_a(Entity, n3).
is_a(Entity, j4) :-
    is_a(Entity, n3).
is_a(Entity, n5) :-
    is_a(Entity, n4).
is_a(Entity, i5) :-
    is_a(Entity, n4).
is_a(Entity, j5) :-
    is_a(Entity, n4).
is_a(Entity, n6) :-
    is_a(Entity, n5).
is_a(Entity, i6) :-
    is_a(Entity, n5).
is_a(Entity, j6) :-
    is_a(Entity, n5).
is_a(Entity, n7) :-
    is_a(Entity, n6).
is_a(Entity, i7) :-
    is_a(Entity, n6).
is_a(Entity, j7) :-
    is_a(Entity, n6).
is_a(Entity, n8) :-
    is_a(Entity, n7).
is_a(Entity, i8) :-
    is_a(Entity, n7).
is_a(Entity, j8) :-
    is_a(Entity, n7).
is_a(Entity, n9) :-
    is_a(Entity, n8).
is_a(Entity, i9) :-
    is_a(Entity, n8).
is_a(Entity, j9) :-
    is_a(Entity, n8).
is_a(Entity, n10) :-
    is_a(Entity, n9).
is_a(Entity, i10) :-
    is_a(Entity, n9).
is_a(Entity, j10) :-
    is_a(Entity, n9).

% Answer and Reason
?- is_a(Who, a2).
?- why.

% Check
:- assertion((is_a(ind, a2))).
:- assertion((is_a(ind, n10))).
:- assertion((is_a(ind, i10))).
:- assertion((is_a(ind, j10))).
:- assertion((\+ (is_a(ind, n11)))).
