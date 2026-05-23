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

queens(N, Qs) :-
  range(1, N, Columns),
  place(1, Columns, [], [], Qs).

place(_, [], _DiagDown, _DiagUp, []).
place(Row, Columns, DiagDown, DiagUp, [Q|Qs]) :-
  select(Q, Columns, RestColumns),
  add(Row, Q, Down),
  not_member(Down, DiagDown),
  sub(Row, Q, Up),
  not_member(Up, DiagUp),
  add(Row, 1, NextRow),
  place(NextRow, RestColumns, [Down|DiagDown], [Up|DiagUp], Qs).

range(J, J, [J]).
range(I, J, [I|Ns]) :-
  lt(I, J),
  add(I, 1, I1),
  range(I1, J, Ns).

triple(nQueens8, solution, Qs) :- queens(8, Qs).
triple(nQueens8, solved, true) :- queens(8, _Qs).
