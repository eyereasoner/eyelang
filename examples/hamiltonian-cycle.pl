% Hamiltonian cycle without cut.
%
% The graph has eight vertices and enough chords to create a non-trivial search
% space.  The first vertex is fixed to avoid rotational duplicates; the two
% cycle directions are still distinct, so the count is for cycles from a fixed
% start in traversal order.

materialize(status, 2).
materialize(witness, 2).
materialize(vertexCount, 2).
materialize(cycleCountFromA, 2).

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
  vertices(Vertices),
  hamiltonian_cycle(edge, Vertices, Cycle).

status(hamiltonian_cycle, exists) :-
  once(hamiltonian_cycle(_Cycle)).

witness(hamiltonian_cycle, Cycle) :-
  once(hamiltonian_cycle(Cycle)).

vertexCount(hamiltonian_cycle, Count) :-
  vertices(Vertices),
  length(Vertices, Count).

cycleCountFromA(hamiltonian_cycle, Count) :-
  findall(Cycle, hamiltonian_cycle(Cycle), Cycles),
  length(Cycles, Count).
