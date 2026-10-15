% Rules over a finite cycle of follows facts.
% The second rule only extends a route when the next link leads to ada.

% Prolog facts and rules.
follows(ada, ben).
follows(ben, cara).
follows(cara, ada).

reaches(From, To) :-
    follows(From, To).
reaches(From, ada) :-
    reaches(From, Via),
    follows(Via, ada).

% Answer and Reason
?- reaches(Who, ada).
?- why((reaches(ben, ada))).

% Check
:- assertion((\+ (reaches(ada, ada)))).
:- assertion((reaches(ben, ada))).
:- assertion((reaches(cara, ada))).
:- assertion((reaches(ben, cara))).
