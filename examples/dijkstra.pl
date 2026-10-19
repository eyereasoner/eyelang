% Dijkstra's algorithm over a finite list of directed edge(From, To, Weight)
% terms with nonnegative weights. Costs retain exact integer arithmetic when
% all weights are integers. A sorted frontier settles each reached node once.
% One minimum-cost path is returned; equal-cost alternatives need not all be
% returned. An unreachable goal has no answer. Start=Goal has cost zero.
% Edge-list traversal and priority insertion replace collection and sorting
% builtins. Negative weights reject the whole graph, including unused edges.

network([edge(a, b, 4), edge(a, c, 2), edge(b, c, 1), edge(b, d, 5),
  edge(c, d, 8), edge(c, e, 10), edge(d, e, 2), edge(d, f, 6), edge(e, f, 3)]).

:- table dijkstra/5, valid_edges/1, undirected/2, search/6, expand/7,
  add_edge/7, insert/3, seen/2, unseen/2, reverse/3, route/4.

valid_edges([]).
valid_edges([edge(_, _, Weight)|Rest]) :- Weight >= 0, valid_edges(Rest).
undirected([], []).
undirected([edge(A, B, W)|Rest], [edge(A, B, W), edge(B, A, W)|Tail]) :-
  undirected(Rest, Tail).
seen(Node, [Node|_]).
seen(Node, [_|Rest]) :- seen(Node, Rest).
unseen(_, []).
unseen(Node, [Other|Rest]) :- Node \= Other, unseen(Node, Rest).
reverse([], Accumulator, Accumulator).
reverse([Head|Tail], Accumulator, Result) :- reverse(Tail, [Head|Accumulator], Result).

dijkstra(Edges, Start, Goal, Path, Cost) :-
  valid_edges(Edges), search([entry(0, Start, [Start])], Goal, [], Edges, Backwards, Cost),
  reverse(Backwards, [], Path).

search([entry(Cost, Goal, Path)|_], Goal, Visited, _, Path, Cost) :-
  unseen(Goal, Visited).
search([entry(_, Node, _)|Queue], Goal, Visited, Edges, Path, Cost) :-
  seen(Node, Visited), search(Queue, Goal, Visited, Edges, Path, Cost).
search([entry(Cost, Node, Path)|Queue], Goal, Visited, Edges, Result, Total) :-
  Node \= Goal, unseen(Node, Visited),
  expand(Edges, Node, Cost, Path, [Node|Visited], Queue, Next),
  search(Next, Goal, [Node|Visited], Edges, Result, Total).

expand([], _, _, _, _, Queue, Queue).
expand([Edge|Rest], Node, Cost, Path, Visited, Queue, Result) :-
  add_edge(Edge, Node, Cost, Path, Visited, Queue, Next),
  expand(Rest, Node, Cost, Path, Visited, Next, Result).
add_edge(edge(From, _, _), Node, _, _, _, Queue, Queue) :- From \= Node.
add_edge(edge(Node, To, _), Node, _, _, Visited, Queue, Queue) :- seen(To, Visited).
add_edge(edge(Node, To, Weight), Node, Cost, Path, Visited, Queue, Result) :-
  unseen(To, Visited), Next is Cost+Weight,
  insert(entry(Next, To, [To|Path]), Queue, Result).

insert(Entry, [], [Entry]).
insert(entry(C, N, P), [entry(D, M, Q)|Rest], [entry(C, N, P), entry(D, M, Q)|Rest]) :- C =< D.
insert(entry(C, N, P), [entry(D, M, Q)|Rest], [entry(D, M, Q)|Tail]) :-
  C > D, insert(entry(C, N, P), Rest, Tail).

% The sample network is undirected; the reusable dijkstra/5 accepts directed
% edges. Bind Start and Goal before calling either route/4 or dijkstra/5.
route(Start, Goal, Path, Cost) :-
  network(Edges), undirected(Edges, Arcs), dijkstra(Arcs, Start, Goal, Path, Cost).

% Answer and Reason
?- route(a, f, Path, Cost).
?- why.
?- route(f, a, Path, Cost).
?- route(a, a, Path, Cost).

% Check
:- assertion(route(a, f, [a, c, b, d, e, f], 13)).
:- assertion(route(f, a, [f, e, d, b, c, a], 13)).
:- assertion(route(a, a, [a], 0)).
:- assertion(aggregate_all(count, route(a, unreachable, _, _), 0)).
:- assertion(aggregate_all(count, dijkstra([edge(a, b, -1)], a, b, _, _), 0)).
