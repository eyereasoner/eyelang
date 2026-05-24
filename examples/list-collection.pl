% List collections inspired by the Eyeling collection example.
% Demonstrates list literals, member/2, length/2, append/3, and [Head|Tail].
materialize(length, 2).
materialize(member, 2).
materialize(append, 2).
materialize(head, 2).
materialize(tail, 2).

collection(numbers, [1, 2, 3]).
collection(letters, [a, b]).

length(numbers, N) :-
  collection(numbers, List),
  length(List, N).

member(numbers, X) :-
  collection(numbers, List),
  member(X, List).

append(letters, Extended) :-
  collection(letters, List),
  append(List, [c], Extended).

head(letters, Head) :-
  collection(letters, [Head|_Tail]).

tail(letters, Tail) :-
  collection(letters, [_Head|Tail]).
