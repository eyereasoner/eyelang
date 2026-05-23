% Hamiltonian cycle without cut.
%
% The graph has eight vertices and enough chords to create a non-trivial search
% space.  The first vertex is fixed to avoid rotational duplicates; the two
% cycle directions are still distinct, so the count is for cycles from a fixed
% start in traversal order.

edge(a, b).
edge(a, f).
edge(a, g).
edge(a, h).
edge(b, c).
edge(b, d).
edge(b, g).
edge(b, h).
edge(c, d).
edge(c, e).
edge(c, g).
edge(d, e).
edge(d, g).
edge(d, h).
edge(e, f).
edge(f, g).
edge(g, h).

adjacent(X, Y) :- edge(X, Y).
adjacent(X, Y) :- edge(Y, X).

vertices([a, b, c, d, e, f, g, h]).

hamiltonian_cycle(Cycle) :-
  vertices([Start|Rest]),
  visit_cycle(Start, Start, Rest, [Start], Cycle).

visit_cycle(Current, Start, [], Visited, Cycle) :-
  adjacent(Current, Start),
  reverse(Visited, Path),
  append(Path, [Start], Cycle).

visit_cycle(Current, Start, Remaining, Visited, Cycle) :-
  select(Next, Remaining, Rest),
  adjacent(Current, Next),
  visit_cycle(Next, Start, Rest, [Next|Visited], Cycle).

triple(hamiltonian_cycle, status, exists) :-
  once(hamiltonian_cycle(_Cycle)).

triple(hamiltonian_cycle, witness, Cycle) :-
  once(hamiltonian_cycle(Cycle)).

triple(hamiltonian_cycle, vertexCount, Count) :-
  vertices(Vertices),
  length(Vertices, Count).

triple(hamiltonian_cycle, cycleCountFromA, Count) :-
  findall(Cycle, hamiltonian_cycle(Cycle), Cycles),
  length(Cycles, Count).
