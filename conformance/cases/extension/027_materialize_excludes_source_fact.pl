% SPEC 11: no-query materialization excludes source facts even if also derivable.
materialize(answer, 2).
seed(a).
answer(a, ok).
answer(X, ok) :- seed(X).
answer(b, ok) :- seed(a).
