% Derived rule example adapted from Eyeling derived-rule.n3.
%
% Eyeling source shape:
%   :Minka a :Cat.
%   :Charly a :Dog.
%   { ?x a :Cat. } => { { ?y a :Dog. } => { :test :is true. }. }.
%
% The inner implication is represented directly as quoted formula data.
% var(:y) is not an eyelog variable; it is a ground term that names
% a variable placeholder inside the quoted formula.

triple(:Minka, rdf:type, :Cat).
triple(:Charly, rdf:type, :Dog).

triple(
  triple(var(:y), rdf:type, :Dog),
  log:implies,
  triple(:test, :is, true)
) :-
  triple(_X, rdf:type, :Cat).

triple(:test, :is, true) :-
  triple(
    triple(var(:y), rdf:type, :Dog),
    log:implies,
    triple(:test, :is, true)
  ),
  triple(_Y, rdf:type, :Dog).
