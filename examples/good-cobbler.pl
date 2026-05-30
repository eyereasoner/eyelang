% Good cobbler, adapted from Eyeling's examples/good-cobbler.n3.
%
% The Eyeling result is a quoted assertion saying that joe is a good Cobbler.
% Here the quoted assertion is represented as an SEE term.

materialize(is, 2).

assertedIs(joe, good(cobbler)).

is(test, is(X, good(Y))) :-
  assertedIs(X, good(Y)).
