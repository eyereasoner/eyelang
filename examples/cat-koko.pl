% Cat Koko, adapted from Eyeling's examples/cat-koko.n3.
%
% The Eyeling version uses rules that create two existential witnesses and then
% checks that they are not equal. This Eyelog version names the witnesses.

materialize(is, 2).

animal(koko).
witness(cat, koko, cat_witness).
witness(british_short_hair, koko, british_short_hair_witness).

type(X, cat) :-
  animal(koko),
  witness(cat, koko, X).

type(X, british_short_hair) :-
  animal(koko),
  witness(british_short_hair, koko, X).

is(test, true) :-
  type(X, cat),
  type(Y, british_short_hair),
  neq(X, Y).
