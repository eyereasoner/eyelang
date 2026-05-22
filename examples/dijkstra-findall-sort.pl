% Eyelet-inspired Dijkstra example using findall/3 and sort/2.
% Adapted to Eyelog's explicit built-ins and triple/3 report style.

edge(a, b, 4).
edge(a, c, 2).
edge(b, c, 1).
edge(b, d, 5).
edge(c, d, 8).
edge(c, e, 10).
edge(d, e, 2).
edge(d, f, 6).
edge(e, f, 3).
edge(A, B, Cost) :- edge(B, A, Cost).

dijkstra(Start, Goal, Path, Cost) :-
  dijkstra_queue([[0, Start]], Goal, [], RevPath, Cost),
  reverse(RevPath, Path).

dijkstra_queue([[Cost, Goal | Path] | _Queue], Goal, _Visited, [Goal | Path], Cost).
dijkstra_queue([[Cost, Node | Path] | Queue], Goal, Visited, ResultPath, ResultCost) :-
  findall([NewCost, Neighbor, Node | Path],
    (edge(Node, Neighbor, Weight), not(member(Neighbor, Visited)), add(Cost, Weight, NewCost)),
    Neighbors),
  append(Queue, Neighbors, NewQueue),
  sort(NewQueue, SortedQueue),
  dijkstra_queue(SortedQueue, Goal, [Node | Visited], ResultPath, ResultCost).

triple(dijkstra_findall_sort, shortestPath, Path) :-
  once(dijkstra(a, f, Path, _Cost)).

triple(dijkstra_findall_sort, cost, Cost) :-
  once(dijkstra(a, f, _Path, Cost)).

triple(dijkstra_findall_sort, reason, "frontier candidates are collected with findall and ordered with sort").
