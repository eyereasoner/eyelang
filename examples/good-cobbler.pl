% Good cobbler, adapted from Eyeling's examples/good-cobbler.n3.
%
% The example demonstrates term-level structure: Joe is a good cobbler, so
% there is someone who is good at something.

materialize(answer, 2).

is(joe, good(cobbler)).

answer(test, is(X, good(Y))) :-
  is(X, good(Y)).
