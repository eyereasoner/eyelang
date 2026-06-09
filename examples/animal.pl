% Animal classification, adapted from Eyelet's input/animal.pl.
%
% The Eyelet source uses Unicode predicate names; this eyelang version keeps the
% same tiny inheritance idea with plain vocabulary names.

materialize(type, 2).
materialize(subclassOf, 2).
materialize(succeeds, 2).

human(joe).
animal(human).

animal(X) :- human(X).

type(joe, human) :- human(joe).
type(joe, animal) :- animal(joe).
subclassOf(human, animal) :- animal(human).
succeeds(animalExample, true) :- animal(_).
