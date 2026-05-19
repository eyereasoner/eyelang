% Cyclic transitive closure. The graph contains a directed cycle, but eyelog's
% variant loop guard prevents recursive proof search from revisiting the same
% active subgoal forever.

arc(:a, :b).
arc(:b, :c).
arc(:c, :d).
arc(:d, :a).

path(X, Y) :- arc(X, Y).
path(X, Z) :- arc(X, Y), path(Y, Z).

triple(X, :path, Y) :- path(X, Y).
