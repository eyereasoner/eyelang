% Derived rule example adapted from Eyeling derived-rule.n3.
%
% Eyeling source shape:
%   minka a cat.
%   charly a dog.
%   { ?x a cat. } => { { ?y a dog. } => { test is true. }. }.
%
% The inner implication is represented directly as quoted formula data.
% var(y) is not an see variable; it is a ground term that names
% a variable placeholder inside the quoted formula.

materialize(type, 2).
materialize(log_implies, 2).
materialize(is, 2).

type(minka, cat).
type(charly, dog).

log_implies(type(var(y), dog), is(test, true)) :-
  type(_X, cat).

is(test, true) :-
  log_implies(type(var(y), dog), is(test, true)),
  type(_Y, dog).
