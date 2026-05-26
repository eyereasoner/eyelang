% Generic 9x9 Sudoku example using the compiled sudoku/2 builtin.
%
% Puzzles are 81-character strings read row-major. Digits 1..9 are givens;
% 0, dot, or underscore marks a blank. The builtin also accepts a 9x9 list
% of integers in the same representation.

materialize(solution, 2).

puzzle(classic,
  "100007090030129008009600500005300900010080002600794000350408219240005867897201304").

puzzle(third,
  "078200000005000400100400092000035070007000500050810000720004008009000300000006910").

solution(Name, Rows) :-
  puzzle(Name, Grid),
  sudoku(Grid, Rows).
