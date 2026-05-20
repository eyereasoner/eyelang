% Socrates is mortal, adapted from Eyelet's input/socrates.pl.
%
% Eyelet uses type('Socrates', 'Man') and a single rule deriving Mortal.
% Eyelog keeps the same reasoning shape and emits RDF-shaped triples.

type(socrates, man).

type(X, mortal) :-
  type(X, man).

triple(X, type, T) :-
  type(X, T).

triple(test, is, true) :-
  type(socrates, mortal).
