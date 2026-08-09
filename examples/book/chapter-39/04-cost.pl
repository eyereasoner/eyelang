% From The Art of EyeProlog, Chapter 39.
:- use_module(library(eyeprolog)).
:- use_module(library(lists)).

cost(a, 8).
cost(b, 3).
cost(c, 3).

answer(count, N) :- countall(cost(_, _), N).
answer(best(Name), Cost) :-
  aggregate_min(CandidateCost, CandidateName,
                cost(CandidateName, CandidateCost),
                Cost, Name).
