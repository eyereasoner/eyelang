% Animal classification, adapted from Eyelet's input/animal.pl.
%
% The Eyelet source uses Unicode predicate names; this Eyelog version keeps the
% same tiny inheritance idea with plain vocabulary names.

human(joe).
animal(human).

animal(X) :- human(X).

triple(joe, type, human) :- human(joe).
triple(joe, type, animal) :- animal(joe).
triple(human, subclassOf, animal) :- animal(human).
triple(animalExample, succeeds, true) :- animal(_).
