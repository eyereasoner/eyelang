/** Portable solution aggregation relations. */

:- module(aggregate, [sumall/3, aggregate_min/5, aggregate_max/5]).

:- meta_predicate(sumall('?', 0, '?')).
:- meta_predicate(aggregate_min('?', '?', 0, '?', '?')).
:- meta_predicate(aggregate_max('?', '?', 0, '?', '?')).

sumall(Expression, Goal, Sum) :-
    findall(Value, (Goal, Value is Expression), Values),
    aggregate__sum_list(Values, 0, Sum).

aggregate_min(Key, Value, Goal, BestKey, BestValue) :-
    findall(Key-Value, Goal, Pairs),
    keysort(Pairs, [BestKey-BestValue|_]).

aggregate_max(Key, Value, Goal, BestKey, BestValue) :-
    findall(Key-Value, Goal, Pairs),
    aggregate__reverse(Pairs, [], ReversePairs),
    keysort(ReversePairs, Sorted),
    aggregate__last_pair(Sorted, BestKey-BestValue).

aggregate__sum_list([], Sum, Sum).
aggregate__sum_list([X|Xs], Acc, Sum) :-
    Next is Acc + X,
    aggregate__sum_list(Xs, Next, Sum).

aggregate__reverse([], Acc, Acc).
aggregate__reverse([X|Xs], Acc, Out) :- aggregate__reverse(Xs, [X|Acc], Out).

aggregate__last_pair([Pair], Pair).
aggregate__last_pair([_|Pairs], Pair) :- aggregate__last_pair(Pairs, Pair).

