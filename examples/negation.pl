% Three players want to join a game.
% A player can join if the program does not show that they need rest.
% This rule is checked before the not clue, even though it comes later.
% You can also use "is not" for a kind.

% Prolog facts and rules.
is_a(milo, player).
is_a(luna, player).
is_a(rex, player).
is_a(luna, 'tired-player').

is_a(Player, 'ready-player') :-
    is_a(Player, player),
    \+ (needs(Player, rest)).
needs(Player, rest) :-
    is_a(Player, 'tired-player').
is_a(Player, 'eager-player') :-
    is_a(Player, player),
    \+ (is_a(Player, 'tired-player')).

% Answer and Reason
?- is_a(Who, 'ready-player').
?- why.
?- is_a(Who, 'eager-player').
?- \+ (needs(milo, rest)).
?- why.
?- \+ (needs(luna, rest)).
?- why.
?- aggregate_all(count, is_a(Subject, 'ready-player'), Result).

% Check
:- assertion((is_a(milo, 'ready-player'))).
:- assertion((is_a(rex, 'ready-player'))).
:- assertion((\+ (is_a(luna, 'ready-player')))).
:- assertion((needs(luna, rest))).
:- assertion((\+ (needs(milo, rest)))).
:- assertion((aggregate_all(count, is_a(Subject, 'ready-player'), 2))).
