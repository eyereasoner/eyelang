% Generic 9x9 Sudoku example, adapted from Eyeling's examples/sudoku.n3.
%
% The Eyeling version delegates solving to examples/builtin/sudoku.js.  Eyelog
% now exposes the same idea as a generic native solver: sudoku(Puzzle, Solution)
% accepts any standard 81-character puzzle string, with 0 or . for blanks, and
% returns a completed 9x9 grid.  The built-in is not tied to this puzzle.

materialize(name, 2).
materialize(puzzleName, 2).
materialize(puzzle, 2).
materialize(solution, 2).
materialize(status, 2).
materialize(firstRow, 2).
materialize(solvedBy, 2).

name(case, "sudoku").
puzzleName(case, classic).
puzzle(case, "100007090030020008009600500005300900010080002600004000300000010040000007007000300").

solution(Name, Solution) :-
  puzzleName(case, Name),
  puzzle(case, Puzzle),
  once(sudoku(Puzzle, Solution)).

solution(case, Solution) :-
  puzzleName(case, Name),
  solution(Name, Solution).

status(case, ok) :-
  puzzleName(case, Name),
  solution(Name, _Solution).

firstRow(case, Row) :-
  puzzleName(case, Name),
  solution(Name, [Row|_Rows]).

solvedBy(case, generic_sudoku_builtin).
