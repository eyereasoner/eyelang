% List collections inspired by the Eyeling collection example.
% Demonstrates list literals, member/2, length/2, append/3, and [Head|Tail].
collection(numbers, [1, 2, 3]).
collection(letters, [a, b]).

triple(numbers, length, N) :-
  collection(numbers, List),
  length(List, N).

triple(numbers, member, X) :-
  collection(numbers, List),
  member(X, List).

triple(letters, append, Extended) :-
  collection(letters, List),
  append(List, [c], Extended).

triple(letters, head, Head) :-
  collection(letters, [Head|_Tail]).

triple(letters, tail, Tail) :-
  collection(letters, [_Head|Tail]).
