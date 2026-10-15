% Find routes through French cities.
% Each connects fact is a one-way road: travel from left to right.
% Work backwards from the route asked for: one road is enough.
% Take one road, then follow a route from the next city.
% There is also a route to Tours.
% Roads only go in the direction written above.

% Prolog facts and rules.
:- table reaches/2.
connects(paris, orleans).
connects(paris, chartres).
connects(paris, amiens).
connects(orleans, blois).
connects(orleans, bourges).
connects(blois, tours).
connects(chartres, lemans).
connects(lemans, angers).
connects(lemans, tours).
connects(angers, nantes).

reaches(From, To) :-
    connects(From, To).
reaches(From, To) :-
    connects(From, Via),
    reaches(Via, To).

% Answer and Reason
?- reaches(Who, nantes).
?- reaches(paris, nantes).
?- why.
?- reaches(paris, tours).
?- why.
?- reaches(nantes, paris).

% Check
:- assertion((reaches(paris, nantes))).
:- assertion((reaches(chartres, nantes))).
:- assertion((reaches(lemans, nantes))).
:- assertion((reaches(angers, nantes))).
:- assertion((reaches(paris, tours))).
:- assertion((\+ (reaches(nantes, paris)))).
:- assertion((\+ (reaches(tours, nantes)))).
