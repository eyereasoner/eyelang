% N queens: list position is the row, list value is the column (both 1-based).
% Supply a nonnegative integer board size.
:- table queens/2, columns/3, select/3, place/3, safe/3.

queens(N, Columns) :- N >= 0, columns(1, N, Available), place(Available, [], Columns).
columns(I, N, []) :- I > N.
columns(I, N, [I|Rest]) :- I =< N, Next is I+1, columns(Next, N, Rest).
select(X, [X|Rest], Rest).
select(X, [Y|Rest], [Y|Remaining]) :- select(X, Rest, Remaining).
place([], _, []).
place(Available, Placed, [Column|Rest]) :-
    select(Column, Available, Remaining), safe(Column, Placed, 1),
    place(Remaining, [Column|Placed], Rest).
safe(_, [], _).
safe(Column, [Other|Rest], Distance) :-
    Column =\= Other+Distance, Column =\= Other-Distance,
    Next is Distance+1, safe(Column, Rest, Next).

% Answer and Reason
?- queens(8, Columns).
?- why(queens(8, [1, 5, 8, 6, 3, 7, 2, 4])).
?- aggregate_all(count, queens(8, Columns), Count).

% Check
:- assertion(queens(0, [])).
:- assertion(queens(1, [1])).
:- assertion(queens(4, [2, 4, 1, 3])).
:- assertion(queens(4, [3, 1, 4, 2])).
:- assertion(aggregate_all(count, queens(2, Columns), 0)).
:- assertion(aggregate_all(count, queens(3, Columns), 0)).
:- assertion(aggregate_all(count, queens(4, Columns), 2)).
:- assertion(aggregate_all(count, queens(8, Columns), 92)).
:- assertion(\+ queens(-1, [])).
:- assertion(\+ queens(4, [1, 2, 3, 4])).
