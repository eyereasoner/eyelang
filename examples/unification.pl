% Open lists and repeated variables enforce structural relationships.
% A supplied complete list bounds the possible prefix/suffix splits.
:- table append/3.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

matching_pair(pair(X, X)).
head_tail([Head | Tail], Head, Tail).

% Answer and Reason
?- append(Prefix, Suffix, [a, b]).
?- why.
?- matching_pair(pair(same, same)).
?- why.
?- matching_pair(pair(a, b)).
?- head_tail([a, b, c], Head, Tail).
?- why.

% Check
:- assertion(append([], [a, b], [a, b])).
:- assertion(append([a], [b], [a, b])).
:- assertion(append([a, b], [], [a, b])).
:- assertion(aggregate_all(count, append(Prefix, Suffix, [a, b]), 3)).
:- assertion(matching_pair(pair(same, same))).
:- assertion(\+ matching_pair(pair(a, b))).
:- assertion(head_tail([a, b, c], a, [b, c])).
