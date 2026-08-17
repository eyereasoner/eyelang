/** List relations, following the library(lists) organization used by Scryer. */

:- module(lists, [
    member/2,
    memberchk/2,
    select/3,
    append/2,
    append/3,
    last/2,
    same_length/2,
    nth0/3,
    nth0/4,
    nth1/3,
    nth1/4,
    reverse/2,
    length/2,
    maplist/2,
    maplist/3,
    maplist/4,
    maplist/5,
    maplist/6,
    maplist/7,
    maplist/8,
    foldl/4,
    foldl/5,
    foldl/6,
    sum_list/2,
    min_list/2,
    max_list/2,
    list_to_set/2,
    countall/2,
    set_nth0/4,
    take/3,
    drop/3,
    slice/4
]).

:- meta_predicate(maplist(1, '?')).
:- meta_predicate(maplist(2, '?', '?')).
:- meta_predicate(maplist(3, '?', '?', '?')).
:- meta_predicate(maplist(4, '?', '?', '?', '?')).
:- meta_predicate(maplist(5, '?', '?', '?', '?', '?')).
:- meta_predicate(maplist(6, '?', '?', '?', '?', '?', '?')).
:- meta_predicate(maplist(7, '?', '?', '?', '?', '?', '?', '?')).
:- meta_predicate(foldl(3, '?', '?', '?')).
:- meta_predicate(foldl(4, '?', '?', '?', '?')).
:- meta_predicate(foldl(5, '?', '?', '?', '?', '?')).
:- meta_predicate(countall(0, '?')).

% Common pure-Prolog library predicates for EyeProlog.
%
% The common Trealla/Scryer-facing surface can be imported explicitly with
% use_module(library(lists)); EyeProlog may also autoload those common
% indicators when an otherwise undefined unqualified call is encountered.
% EyeProlog-specific helpers remain explicit and are diagnosed by --warnings.

maplist(_, []).
maplist(Closure, [A|As]) :-
    call(Closure, A),
    maplist(Closure, As).

maplist(_, [], []).
maplist(Closure, [A|As], [B|Bs]) :-
    call(Closure, A, B),
    maplist(Closure, As, Bs).

maplist(_, [], [], []).
maplist(Closure, [A|As], [B|Bs], [C|Cs]) :-
    call(Closure, A, B, C),
    maplist(Closure, As, Bs, Cs).

maplist(_, [], [], [], []).
maplist(Closure, [A|As], [B|Bs], [C|Cs], [D|Ds]) :-
    call(Closure, A, B, C, D),
    maplist(Closure, As, Bs, Cs, Ds).

maplist(_, [], [], [], [], []).
maplist(Closure, [A|As], [B|Bs], [C|Cs], [D|Ds], [E|Es]) :-
    call(Closure, A, B, C, D, E),
    maplist(Closure, As, Bs, Cs, Ds, Es).

maplist(_, [], [], [], [], [], []).
maplist(Closure, [A|As], [B|Bs], [C|Cs], [D|Ds], [E|Es], [F|Fs]) :-
    call(Closure, A, B, C, D, E, F),
    maplist(Closure, As, Bs, Cs, Ds, Es, Fs).

maplist(_, [], [], [], [], [], [], []).
maplist(Closure, [A|As], [B|Bs], [C|Cs], [D|Ds], [E|Es], [F|Fs], [G|Gs]) :-
    call(Closure, A, B, C, D, E, F, G),
    maplist(Closure, As, Bs, Cs, Ds, Es, Fs, Gs).

append([], []).
append([Xs|Xss], Ys) :-
    append(Xs, Rest, Ys),
    append(Xss, Rest).

append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

member(X, [X|_]).
member(X, [_|Xs]) :- member(X, Xs).

memberchk(X, Xs) :- member(X, Xs), !.

select(X, [X|Xs], Xs).
select(X, [Y|Ys], [Y|Zs]) :- select(X, Ys, Zs).

last([X], X).
last([_|Xs], X) :- last(Xs, X).

same_length([], []).
same_length([_|Xs], [_|Ys]) :- same_length(Xs, Ys).

nth0(N, List, Elem) :- nth0(N, List, Elem, _).

nth0(0, [Elem|Rest], Elem, Rest).
nth0(N, [X|Xs], Elem, [X|Rest]) :-
    var(N),
    nth0(N0, Xs, Elem, Rest),
    N is N0 + 1.
nth0(N, [X|Xs], Elem, [X|Rest]) :-
    nonvar(N),
    N > 0,
    N0 is N - 1,
    nth0(N0, Xs, Elem, Rest).

nth1(N, List, Elem) :- nth1(N, List, Elem, _).

nth1(N, List, Elem, Rest) :-
    N \== 0,
    nth0(N, [_|List], Elem, [_|Rest]),
    N \== 0.

reverse(List, Reversed) :- lists__reverse(List, [], Reversed).

length(List, Length) :- nonvar(List), lists__length_count(List, 0, Length).
length(List, Length) :- var(List), integer(Length), Length >= 0, lists__length_make(Length, List).

foldl(_, [], Acc, Acc).
foldl(Closure, [A|As], Acc0, Acc) :-
    call(Closure, A, Acc0, Acc1),
    foldl(Closure, As, Acc1, Acc).

foldl(_, [], [], Acc, Acc).
foldl(Closure, [A|As], [B|Bs], Acc0, Acc) :-
    call(Closure, A, B, Acc0, Acc1),
    foldl(Closure, As, Bs, Acc1, Acc).

foldl(_, [], [], [], Acc, Acc).
foldl(Closure, [A|As], [B|Bs], [C|Cs], Acc0, Acc) :-
    call(Closure, A, B, C, Acc0, Acc1),
    foldl(Closure, As, Bs, Cs, Acc1, Acc).

sum_list(List, Sum) :- lists__sum_list(List, 0, Sum).

min_list([X|Xs], Min) :- lists__min_list(Xs, X, Min).

max_list([X|Xs], Max) :- lists__max_list(Xs, X, Max).

list_to_set(List, Set) :- lists__list_to_set(List, [], Set).

countall(Goal, Count) :- eyeprolog__countall(Goal, Count).

set_nth0(0, [_|Xs], X, [X|Xs]).
set_nth0(N, [Y|Ys], X, [Y|Zs]) :-
    N > 0,
    N1 is N - 1,
    set_nth0(N1, Ys, X, Zs).

take(0, _, []).
take(N, [X|Xs], [X|Ys]) :-
    N > 0,
    N1 is N - 1,
    take(N1, Xs, Ys).

drop(0, Xs, Xs).
drop(N, [_|Xs], Ys) :-
    N > 0,
    N1 is N - 1,
    drop(N1, Xs, Ys).

slice(Start, Count, List, Slice) :-
    drop(Start, List, Tail),
    take(Count, Tail, Slice).

lists__reverse([], Acc, Acc).
lists__reverse([X|Xs], Acc, Out) :- lists__reverse(Xs, [X|Acc], Out).

lists__length_count([], N, N).
lists__length_count([_|Xs], N0, N) :- N1 is N0 + 1, lists__length_count(Xs, N1, N).
lists__length_make(0, []).
lists__length_make(N, [_|Xs]) :- N > 0, N1 is N - 1, lists__length_make(N1, Xs).

lists__sum_list([], Sum, Sum).
lists__sum_list([X|Xs], Acc, Sum) :- Next is Acc + X, lists__sum_list(Xs, Next, Sum).

lists__min_list([], Min, Min).
lists__min_list([X|Xs], Current, Min) :- X @< Current, lists__min_list(Xs, X, Min).
lists__min_list([X|Xs], Current, Min) :- X @>= Current, lists__min_list(Xs, Current, Min).

lists__max_list([], Max, Max).
lists__max_list([X|Xs], Current, Max) :- X @> Current, lists__max_list(Xs, X, Max).
lists__max_list([X|Xs], Current, Max) :- X @=< Current, lists__max_list(Xs, Current, Max).

lists__list_to_set([], _, []).
lists__list_to_set([X|Xs], Seen, Set) :-
    lists__identical_member(X, Seen), !,
    lists__list_to_set(Xs, Seen, Set).
lists__list_to_set([X|Xs], Seen, [X|Set]) :-
    lists__list_to_set(Xs, [X|Seen], Set).

lists__identical_member(X, [Y|_]) :- X == Y.
lists__identical_member(X, [_|Ys]) :- lists__identical_member(X, Ys).
