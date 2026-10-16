% Move three disks using a spare peg; recursion constructs the move list.
:- table append/3, moves/5.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

moves(1, From, To, _, [move(From, To)]).
moves(N, From, To, Spare, Moves) :-
    N > 1,
    Smaller is N - 1,
    moves(Smaller, From, Spare, To, First),
    moves(Smaller, Spare, To, From, Last),
    append(First, [move(From, To) | Last], Moves).

% Answer and Reason
?- moves(3, left, right, center, Moves).
?- why.

% Check
:- assertion(moves(1, left, right, center, [move(left, right)])).
:- assertion(moves(2, left, right, center,
    [move(left, center), move(left, right), move(center, right)])).
:- assertion(moves(3, left, right, center,
    [move(left, right), move(left, center), move(right, center),
     move(left, right), move(center, left), move(center, right),
     move(left, right)])).
