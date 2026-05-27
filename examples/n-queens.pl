% N-queens search without cut.
%
% A solution is represented as a list of column numbers.  The list position is
% the row, so [1, 5, 8, ...] means row 1 uses column 1, row 2 uses column 5,
% and so on.  Columns are selected from a finite list, which guarantees that no
% two queens share a column.
%
% The two diagonal sets are carried as accumulator lists.  A queen at
% row Row/column Q occupies the down diagonal Row + Q and the up diagonal
% Row - Q.  Rejecting repeats in those two lists enforces the remaining
% N-queens constraints declaratively, without cut or destructive update.

materialize(solution, 2).
materialize(solved, 2).

queens(N, Qs) :-
  n_queens(N, Qs).

solution(nQueens8, Qs) :- queens(8, Qs).
solved(nQueens8, true) :- queens(8, _Qs).
