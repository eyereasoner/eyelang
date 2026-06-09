% socket-family.pl
%
% A small runnable eyelang Socket example.
%
% The socket facts below are ordinary eyelang data. They document the
% semantic opening: this reasoning module expects a provider for parent/2.
% The plug fact says which provider is connected.
%
% Run:
%   eyelang socket-family.pl

materialize(ancestor, 2).

socket(family_source, provides(parent_2)).
plug(family_file, family_source).

parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).
