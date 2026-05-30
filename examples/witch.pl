% Burn the witch, adapted from Eyeling's examples/witch.n3.
%
% This is the classic N3/Semantic Web rule chain in SEE form: a duck
% floats; something with the same weight as something that floats also floats;
% things that float are made of wood; things made of wood burn; and a woman
% who burns is a witch.

materialize(floats, 1).
materialize(madeOfWood, 1).
materialize(burns, 1).
materialize(witch, 1).
materialize(is, 2).

witch(X) :-
  burns(X),
  woman(X).

woman(girl).

burns(X) :-
  madeOfWood(X).

madeOfWood(X) :-
  floats(X).

floats(duck).

floats(Y) :-
  sameWeight(X, Y),
  floats(X).

sameWeight(duck, girl).

is(witchExample, true) :-
  witch(girl).
