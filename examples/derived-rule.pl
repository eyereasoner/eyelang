% Derived rule example adapted from Eyeling derived-rule.n3.
%
% Eyeling source shape:
%   :Minka a :Cat.
%   :Charly a :Dog.
%   { ?x a :Cat. } => { { ?y a :Dog. } => { :test :is true. }. }.
%
% The inner implication is represented directly as quoted graph data.

triple(:Minka, rdf:type, :Cat).
triple(:Charly, rdf:type, :Dog).

triple(
  graph([triple(var(:y), rdf:type, :Dog)]),
  log:implies,
  graph([triple(:test, :is, true)])
) :-
  triple(_X, rdf:type, :Cat).

triple(:test, :is, true) :-
  triple(
    graph([triple(var(:y), rdf:type, :Dog)]),
    log:implies,
    graph([triple(:test, :is, true)])
  ),
  triple(_Y, rdf:type, :Dog).
