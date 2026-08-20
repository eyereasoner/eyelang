:- use_module(library(clpz)).
:- use_module(library(lists), [length/2]).

% The list position is a column and its value is a row. Domains, global
% distinctness, and delayed diagonal constraints describe the puzzle before
% labeling searches the remaining finite alternatives.
%
% The main example records one witness for the classic eight-queens problem.
% A smaller four-queens query also checks that queens/2 still enumerates
% multiple solutions without carrying a 92-answer golden file.

%% goal: queens8_solution(X0)
%% goal: queens(4, X0)

queens8_solution(Rows) :-
  queens(8, Rows),
  !.

queens(Size, Rows) :-
  length(Rows, Size),
  Rows ins 1..Size,
  all_distinct(Rows),
  safe_diagonals(Rows),
  labeling([ff], Rows).

safe_diagonals([]).
safe_diagonals([Row|Rows]) :-
  safe_from(Row, Rows, 1),
  safe_diagonals(Rows).

safe_from(_, [], _).
safe_from(Row, [Other|Rows], Distance) :-
  Row #\= Other + Distance,
  Row #\= Other - Distance,
  NextDistance is Distance + 1,
  safe_from(Row, Rows, NextDistance).
