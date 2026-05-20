% Generic 9x9 Sudoku example, adapted from Eyeling's examples/sudoku.n3.
%
% The Eyeling version delegates solving to examples/builtin/sudoku.js.  Eyelog
% now exposes the same idea as a generic native solver: sudoku(Puzzle, Solution)
% accepts any standard 81-character puzzle string, with 0 or . for blanks, and
% returns a completed 9x9 grid.  The built-in is not tied to this puzzle.

triple(case, name, "sudoku").
triple(case, puzzleName, classic).
triple(case, puzzle, "100007090030020008009600500005300900010080002600004000300000010040000007007000300").

solution(Name, Solution) :-
  triple(case, puzzleName, Name),
  triple(case, puzzle, Puzzle),
  once(sudoku(Puzzle, Solution)).

triple(case, solution, Solution) :-
  triple(case, puzzleName, Name),
  solution(Name, Solution).

triple(case, status, ok) :-
  triple(case, puzzleName, Name),
  solution(Name, _Solution).

triple(case, firstRow, Row) :-
  triple(case, puzzleName, Name),
  solution(Name, [Row|_Rows]).

triple(case, solvedBy, generic_sudoku_builtin).
