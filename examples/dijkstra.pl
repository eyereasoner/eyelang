% Weighted path enumeration adapted from Eyeling dijkstra.n3.
% The Eyeling source uses collect/sort built-ins for Dijkstra's queue.
% This eyelog variant enumerates simple paths and keeps the bounded frontier
% that appears in the Eyeling output for a -> f.
% The input weighted graph is quoted as ... data and projected locally,
% so the route network is not asserted as ambient edge facts.

materialize(edge, 2).
materialize(path, 2).

weighted_graph(dijkstraGraph, (
  edge(a, arc(b, 4)),
  edge(a, arc(c, 2)),
  edge(b, arc(c, 1)),
  edge(b, arc(d, 5)),
  edge(c, arc(d, 8)),
  edge(c, arc(e, 10)),
  edge(d, arc(e, 2)),
  edge(d, arc(f, 6)),
  edge(e, arc(f, 3))
)).

base_link(A, B, Cost) :-
  weighted_graph(dijkstraGraph, Formula),
  formula_binary(Formula, A, edge, arc(B, Cost)).

link(A, B, Cost) :- base_link(A, B, Cost).
link(B, A, Cost) :- base_link(A, B, Cost).

path(Goal, Goal, _Visited, [Goal], 0).
path(Node, Goal, Visited, [Node|Path], Cost) :-
  link(Node, Next, StepCost),
  not_member(Next, Visited),
  path(Next, Goal, [Next|Visited], Path, RestCost),
  add(StepCost, RestCost, Cost).

% Derived reverse links, mirroring the rule output in the Eyeling example.
edge([B, A], Cost) :-
  base_link(A, B, Cost).

path([a, f], [Path, Cost]) :-
  path(a, f, [a], Path, Cost),
  le(Cost, 16).
