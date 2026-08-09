/** List relations, following the library(lists) organization used by Scryer. */

:- module(lists, [
    maplist/3,
    append/3,
    member/2,
    select/3,
    last/2,
    nth0/3,
    nth1/3,
    reverse/2,
    length/2,
    sum_list/2,
    min_list/2,
    max_list/2,
    list_to_set/2,
    countall/2
]).

:- meta_predicate(maplist(2, '?', '?')).
:- meta_predicate(countall(0, '?')).

% Common pure-Prolog library predicates for EyeProlog.
%
% Load this module explicitly with use_module(library(lists)). The module
% boundary keeps these widespread names separate from same-named predicates in
% other modules.

maplist(_, [], []).
maplist(Closure, [A|As], [B|Bs]) :-
    call(Closure, A, B),
    maplist(Closure, As, Bs).

append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

member(X, [X|_]).
member(X, [_|Xs]) :- member(X, Xs).

select(X, [X|Xs], Xs).
select(X, [Y|Ys], [Y|Zs]) :- select(X, Ys, Zs).

last([X], X).
last([_|Xs], X) :- last(Xs, X).

nth0(0, [X|_], X).
nth0(N, [_|Xs], X) :- var(N), nth0(N0, Xs, X), N is N0 + 1.
nth0(N, [_|Xs], X) :- nonvar(N), N > 0, N1 is N - 1, nth0(N1, Xs, X).

nth1(N, List, X) :- nth0(N0, List, X), N is N0 + 1.

reverse(List, Reversed) :- eyeprolog__reverse(List, [], Reversed).

length(List, Length) :- nonvar(List), eyeprolog__length_count(List, 0, Length).
length(List, Length) :- var(List), integer(Length), Length >= 0, eyeprolog__length_make(Length, List).

sum_list(List, Sum) :- eyeprolog__sum_list(List, 0, Sum).

min_list([X|Xs], Min) :- eyeprolog__min_list(Xs, X, Min).

max_list([X|Xs], Max) :- eyeprolog__max_list(Xs, X, Max).

list_to_set(List, Set) :- eyeprolog__list_to_set(List, [], Set).

countall(Goal, Count) :- findall(1, Goal, Ones), eyeprolog__length_count(Ones, 0, Count).

eyeprolog__reverse([], Acc, Acc).
eyeprolog__reverse([X|Xs], Acc, Out) :- eyeprolog__reverse(Xs, [X|Acc], Out).

eyeprolog__length_count([], N, N).
eyeprolog__length_count([_|Xs], N0, N) :- N1 is N0 + 1, eyeprolog__length_count(Xs, N1, N).
eyeprolog__length_make(0, []).
eyeprolog__length_make(N, [_|Xs]) :- N > 0, N1 is N - 1, eyeprolog__length_make(N1, Xs).

eyeprolog__sum_list([], Sum, Sum).
eyeprolog__sum_list([X|Xs], Acc, Sum) :- Next is Acc + X, eyeprolog__sum_list(Xs, Next, Sum).

eyeprolog__min_list([], Min, Min).
eyeprolog__min_list([X|Xs], Current, Min) :- X @< Current, eyeprolog__min_list(Xs, X, Min).
eyeprolog__min_list([X|Xs], Current, Min) :- X @>= Current, eyeprolog__min_list(Xs, Current, Min).

eyeprolog__max_list([], Max, Max).
eyeprolog__max_list([X|Xs], Current, Max) :- X @> Current, eyeprolog__max_list(Xs, X, Max).
eyeprolog__max_list([X|Xs], Current, Max) :- X @=< Current, eyeprolog__max_list(Xs, Current, Max).

eyeprolog__list_to_set([], _, []).
eyeprolog__list_to_set([X|Xs], Seen, Set) :-
    eyeprolog__identical_member(X, Seen), !,
    eyeprolog__list_to_set(Xs, Seen, Set).
eyeprolog__list_to_set([X|Xs], Seen, [X|Set]) :-
    eyeprolog__list_to_set(Xs, [X|Seen], Set).

eyeprolog__identical_member(X, [Y|_]) :- X == Y.
eyeprolog__identical_member(X, [_|Ys]) :- eyeprolog__identical_member(X, Ys).
