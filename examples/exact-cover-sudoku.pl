% Exact-cover-style 4x4 Sudoku without cut.
%
% Each row is a permutation of 1..4.  Columns and 2x2 boxes are then checked as
% exact covers by sorting them to the canonical digit set.

digits([1, 2, 3, 4]).

row_cover(Row) :-
  sort(Row, [1, 2, 3, 4]).

perm4([A, B, C, D]) :-
  digits(Digits),
  select(A, Digits, D1),
  select(B, D1, D2),
  select(C, D2, D3),
  select(D, D3, []).

sudoku4([[1, B, C, 4], [E, 4, 1, H], [I, 1, 4, L], [4, N, O, 1]]) :-
  perm4([1, B, C, 4]),
  perm4([E, 4, 1, H]),
  perm4([I, 1, 4, L]),
  perm4([4, N, O, 1]),

  row_cover([1, E, I, 4]),
  row_cover([B, 4, 1, N]),
  row_cover([C, 1, 4, O]),
  row_cover([4, H, L, 1]),

  row_cover([1, B, E, 4]),
  row_cover([C, 4, 1, H]),
  row_cover([I, 1, 4, N]),
  row_cover([4, L, O, 1]).

triple(exact_cover_sudoku, status, solved) :-
  once(sudoku4(_Grid)).

triple(exact_cover_sudoku, solution, Grid) :-
  once(sudoku4(Grid)).

triple(exact_cover_sudoku, firstRow, Row) :-
  once(sudoku4([Row|_Rows])).
