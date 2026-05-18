% Weighted path enumeration adapted from Eyeling dijkstra.n3.
% The Eyeling source uses collect/sort built-ins for Dijkstra's queue.
% This eyelog variant enumerates simple paths and keeps the bounded frontier
% that appears in the Eyeling output for :a -> :f.

base_edge(:a, :b, 4).
base_edge(:a, :c, 2).
base_edge(:b, :c, 1).
base_edge(:b, :d, 5).
base_edge(:c, :d, 8).
base_edge(:c, :e, 10).
base_edge(:d, :e, 2).
base_edge(:d, :f, 6).
base_edge(:e, :f, 3).

edge(A, B, Cost) :- base_edge(A, B, Cost).
edge(B, A, Cost) :- base_edge(A, B, Cost).

path(Goal, Goal, _Visited, [Goal], 0).
path(Node, Goal, Visited, [Node|Path], Cost) :-
  edge(Node, Next, StepCost),
  list:notMember(Next, Visited),
  path(Next, Goal, [Next|Visited], Path, RestCost),
  add(StepCost, RestCost, Cost).

% Derived reverse edges, mirroring the rule output in the Eyeling example.
triple([B, A], :edge, Cost) :-
  base_edge(A, B, Cost).

triple([:a, :f], :path, [Path, Cost]) :-
  path(:a, :f, [:a], Path, Cost),
  le(Cost, 16).
