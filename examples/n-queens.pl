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
