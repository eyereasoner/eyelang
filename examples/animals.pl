% Meet our cats.
% A rule works for anyone it fits.
% Our program says nothing about dogs yet.

% Prolog facts and rules.
is_a(milo, cat).
is_a(luna, cat).

is_a(Animal, animal) :-
    is_a(Animal, cat).

% Answer and Reason
?- is_a(Who, animal).
?- is_a(milo, animal).
?- why((is_a(milo, animal))).
?- is_a(milo, dog).

% Check
:- assertion((is_a(milo, animal))).
:- assertion((is_a(luna, animal))).
:- assertion((aggregate_all(count, is_a(Subject, animal), 2))).
:- assertion((\+ (is_a(milo, dog)))).
