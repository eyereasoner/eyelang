% Socrates is mortal, adapted from Eyelet's input/socrates.pl.
%
% Eyelet uses type('Socrates', 'Man') and a single rule deriving Mortal.
% SEE keeps the same reasoning shape and emits relation facts.

materialize(type, 2).
materialize(is, 2).

type(socrates, man).

type(X, mortal) :-
  type(X, man).


is(test, true) :-
  type(socrates, mortal).
