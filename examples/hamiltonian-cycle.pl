% Hamiltonian cycle without cut.
%
% The graph is small but dense enough to have many possible paths.  The program
% fixes the first vertex to avoid rotational duplicates, carries the remaining
% vertices explicitly, and closes the cycle back to the start.

edge(a, b).
edge(a, c).
edge(a, f).
edge(b, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, e).
edge(d, f).
edge(e, f).

adjacent(X, Y) :- edge(X, Y).
adjacent(X, Y) :- edge(Y, X).

vertices([a, b, c, d, e, f]).

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

triple(hamiltonian_cycle, cycleCountFromA, Count) :-
  findall(Cycle, hamiltonian_cycle(Cycle), Cycles),
  length(Cycles, Count).
