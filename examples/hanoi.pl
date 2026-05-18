% Towers of Hanoi adapted from Eyeling hanoi.n3.
% Output is the complete list of moves for size 3.

hanoi(0, _From, _To, _Via, []).
hanoi(N, From, To, Via, Moves) :-
  gt(N, 0),
  sub(N, 1, N1),
  hanoi(N1, From, Via, To, Before),
  hanoi(N1, Via, To, From, After),
  append(Before, [[From, To]|After], Moves).

triple(3, :answer, Moves) :-
  hanoi(3, :left, :right, :center, Moves).
