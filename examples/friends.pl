% In this program, anyone who likes a cat is a friend.

% Prolog facts and rules.
likes(milo, luna).
is_a(luna, cat).

is_a(Person, friend) :-
    likes(Person, Friend),
    is_a(Friend, cat).

% Answer and Reason
?- is_a(Who, friend).
?- likes(Who, luna).
?- likes(milo, What).
?- why((is_a(milo, friend))).

% Check
:- assertion((is_a(milo, friend))).
:- assertion((aggregate_all(count, is_a(Subject, friend), 1))).
:- assertion((\+ (is_a(luna, friend)))).
