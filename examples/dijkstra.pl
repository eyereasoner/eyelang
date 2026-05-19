% Weighted path enumeration adapted from Eyeling dijkstra.n3.
% The Eyeling source uses collect/sort built-ins for Dijkstra's queue.
% This eyelog variant enumerates simple paths and keeps the bounded frontier
% that appears in the Eyeling output for :a -> :f.

base_link(:a, :b, 4).
base_link(:a, :c, 2).
base_link(:b, :c, 1).
base_link(:b, :d, 5).
base_link(:c, :d, 8).
base_link(:c, :e, 10).
base_link(:d, :e, 2).
base_link(:d, :f, 6).
base_link(:e, :f, 3).

link(A, B, Cost) :- base_link(A, B, Cost).
link(B, A, Cost) :- base_link(A, B, Cost).

path(Goal, Goal, _Visited, [Goal], 0).
path(Node, Goal, Visited, [Node|Path], Cost) :-
  link(Node, Next, StepCost),
  list:notMember(Next, Visited),
  path(Next, Goal, [Next|Visited], Path, RestCost),
  add(StepCost, RestCost, Cost).

% Derived reverse links, mirroring the rule output in the Eyeling example.
triple([B, A], :edge, Cost) :-
  base_link(A, B, Cost).

triple([:a, :f], :path, [Path, Cost]) :-
  path(:a, :f, [:a], Path, Cost),
  le(Cost, 16).
