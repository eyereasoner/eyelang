% Derived rule example adapted from Eyeling derived-rule.n3.
%
% Eyeling source shape:
%   minka a cat.
%   charly a dog.
%   { ?x a cat. } => { { ?y a dog. } => { test is true. }. }.
%
% The inner implication is represented directly as quoted formula data.
% var(y) is not an eyelog variable; it is a ground term that names
% a variable placeholder inside the quoted formula.

triple(minka, rdf_type, cat).
triple(charly, rdf_type, dog).

triple(
  triple(var(y), rdf_type, dog),
  log_implies,
  triple(test, is, true)
) :-
  triple(_X, rdf_type, cat).

triple(test, is, true) :-
  triple(
    triple(var(y), rdf_type, dog),
    log_implies,
    triple(test, is, true)
  ),
  triple(_Y, rdf_type, dog).
