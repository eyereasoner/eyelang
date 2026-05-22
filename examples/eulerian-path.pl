% Eyelet-inspired Eulerian path example using findall/3 and sort/2.
% The graph is undirected; edges are represented by identifiers so each edge is used once.

edge(e12, v1, v2).
edge(e13, v1, v3).
edge(e15, v1, v5).
edge(e16, v1, v6).
edge(e23, v2, v3).
edge(e24, v2, v4).
edge(e26, v2, v6).
edge(e34, v3, v4).
edge(e36, v3, v6).
edge(e45, v4, v5).
edge(e46, v4, v6).

vertex(V) :- edge(_E, V, _U).
vertex(V) :- edge(_E, _U, V).

incident(V, E) :- edge(E, V, _U).
incident(V, E) :- edge(E, _U, V).

adjacent_by_edge(V, U, E) :- edge(E, V, U).
adjacent_by_edge(V, U, E) :- edge(E, U, V).

select(Item, [Item | Rest], Rest).
select(Item, [Head | Tail], [Head | Rest]) :-
  select(Item, Tail, Rest).

odd_degree(V) :-
  findall(E, incident(V, E), Edges),
  length(Edges, Degree),
  mod(Degree, 2, 1).

odd_vertices(Odds) :-
  findall(V, odd_degree(V), Raw),
  sort(Raw, Odds).

all_edges(Edges) :-
  findall(E, edge(E, _A, _B), Raw),
  sort(Raw, Edges).

vertices(Vertices) :-
  findall(V, vertex(V), Raw),
  sort(Raw, Vertices).

eulerian_start(Start) :-
  odd_vertices([Start, _End]).
eulerian_start(Start) :-
  odd_vertices([]),
  vertices([Start | _Rest]).

eulerian_path(Path) :-
  eulerian_start(Start),
  all_edges(Edges),
  dfs_euler(Start, [Start], Edges, ReversedPath),
  reverse(ReversedPath, Path).

dfs_euler(_Current, Path, [], Path).
dfs_euler(Current, Visited, Remaining, Path) :-
  adjacent_by_edge(Current, Next, Edge),
  select(Edge, Remaining, NewRemaining),
  dfs_euler(Next, [Next | Visited], NewRemaining, Path).

triple(eulerian_path_case, oddVertices, Odds) :-
  odd_vertices(Odds).

triple(eulerian_path_case, path, Path) :-
  once(eulerian_path(Path)).

triple(eulerian_path_case, edgeCount, Count) :-
  all_edges(Edges),
  length(Edges, Count).

triple(eulerian_path_case, reason, "findall collects graph structure and sort canonicalizes vertices and edges").
