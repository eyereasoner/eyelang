% RDF annotation adapted from Eyeling annotation.n3.
%
% The Eyeling source is deliberately small:
%   :a :name "Alice".
%   :t log:nameOf { :a :name "Alice". }.
%   :t :statedBy :bob.
%   :t :recorded "2021-07-07".
%
% Eyelog uses the same idea directly.  The inner triple is quoted as data
% because it appears as an object term; the top-level triples are ambient
% facts and are printed by the default query.

triple(:a, :name, "Alice").
triple(:t, log:nameOf, triple(:a, :name, "Alice")).
triple(:t, :statedBy, :bob).
triple(:t, :recorded, "2021-07-07").

triple(:__md_output, :text, "# annotation\n").
triple(:__md_output, log:outputString, Text) :-
  triple(:__md_output, :text, Text).
