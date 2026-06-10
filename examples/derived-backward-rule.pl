% Derived backward rule example adapted from Eyeling derived-backward-rule.n3.
%
% Eyeling source shape:
%   parentOf invOf childOf.
%   alice parentOf bob.
%   { ?p invOf ?q. } => { { ?x ?q ?y. } <= { ?y ?p ?x. }. }.
%   { ?x childOf ?y. } => { ?x hasParent ?y. }.
%
% The generated backward rule is represented as quoted formula data in
% log_impliedBy/2, then mirrored as an ordinary eyelang rule so the generated
% childOf relation can feed the ordinary hasParent rule.

materialize(log_impliedBy, 2).
materialize(childOf, 2).
materialize(hasParent, 2).

invOf(parentOf, childOf).
parentOf(alice, bob).

log_impliedBy(childOf(var(x), var(y)), parentOf(var(y), var(x))) :-
  invOf(parentOf, childOf).

childOf(X, Y) :-
  log_impliedBy(childOf(var(x), var(y)), parentOf(var(y), var(x))),
  parentOf(Y, X).

hasParent(X, Y) :- childOf(X, Y).
