% N-Queens puzzle, adapted from Eyelet's input/n-queens.pl.
%
% This uses the classic permutation-and-diagonal-check Prolog encoding, here
% shown for N=8, materializing all 92 solutions.

queens(N, Qs) :-
  range(1, N, Us),
  queens(Us, [], Qs).

queens([], Qs, Qs).
queens(Us, Ps, Qs) :-
  select(Q, Us, Us1),
  not(attack(Q, 1, Ps)),
  queens(Us1, [Q|Ps], Qs).

range(J, J, [J]).
range(I, J, [I|Ns]) :-
  lt(I, J),
  add(I, 1, I1),
  range(I1, J, Ns).

select(X, [X|Xs], Xs).
select(X, [Y|Ys], [Y|Zs]) :- select(X, Ys, Zs).

attack(X, N, [Y|_]) :- add(Y, N, X).
attack(X, N, [Y|_]) :- sub(Y, N, X).
attack(X, N, [_|Ys]) :-
  add(N, 1, N1),
  attack(X, N1, Ys).

triple(nQueens8, solution, Qs) :- queens(8, Qs).
triple(nQueens8, solved, true) :- queens(8, _Qs).
