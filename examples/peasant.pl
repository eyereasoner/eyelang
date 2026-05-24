% Peasant multiplication and exponentiation cases, adapted from Eyelet
% input/peasant.pl.  The selected answers match Eyelet output-swipl/peasant.pl.

materialize(prod, 2).
materialize(pow, 2).

want_prod([3, 0]).
want_prod([5, 6]).
want_prod([238, 13]).
want_prod([8367238, 27133]).
want_prod([62713345408367238, 40836723862713345]).
want_prod([4083672386271334562713345408367238, 4083672386271334562713345408367238]).

want_pow([3, 0]).
want_pow([5, 6]).
want_pow([238, 13]).
want_pow([8367238, 2713]).

prod([A, B], C) :-
  want_prod([A, B]),
  mul(A, B, C).

pow([A, B], C) :-
  want_pow([A, B]),
  pow(A, B, C).
