/** Predicates proposed by the ISO Prolog Prologue working draft. */

:- module(prologue, [
    member/2,
    append/3,
    length/2,
    between/3,
    select/3,
    succ/2,
    maplist/2,
    maplist/3,
    maplist/4,
    maplist/5,
    maplist/6,
    maplist/7,
    maplist/8,
    nth0/3,
    nth0/4,
    nth1/3,
    nth1/4,
    call_nth/2,
    foldl/4,
    foldl/5,
    foldl/6,
    countall/2
]).

:- meta_predicate(maplist(1, '?')).
:- meta_predicate(maplist(2, '?', '?')).
:- meta_predicate(maplist(3, '?', '?', '?')).
:- meta_predicate(maplist(4, '?', '?', '?', '?')).
:- meta_predicate(maplist(5, '?', '?', '?', '?', '?')).
:- meta_predicate(maplist(6, '?', '?', '?', '?', '?', '?')).
:- meta_predicate(maplist(7, '?', '?', '?', '?', '?', '?', '?')).
:- meta_predicate(call_nth(0, '?')).
:- meta_predicate(foldl(3, '?', '?', '?')).
:- meta_predicate(foldl(4, '?', '?', '?', '?')).
:- meta_predicate(foldl(5, '?', '?', '?', '?', '?')).
:- meta_predicate(countall(0, '?')).

member(X, [X|_]).
member(X, [_|Xs]) :- member(X, Xs).

append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

length(List, Length) :-
    nonvar(Length), !,
    prologue__integer(Length),
    prologue__not_less_than_zero(Length),
    prologue__length_fixed(Length, List).
length(List, Length) :-
    prologue__length_generate(List, 0, Length).

prologue__length_fixed(0, []).
prologue__length_fixed(N, [_|Xs]) :-
    N > 0,
    Next is N - 1,
    prologue__length_fixed(Next, Xs).

prologue__length_generate([], N, N).
prologue__length_generate([_|Xs], N0, N) :-
    N1 is N0 + 1,
    prologue__length_generate(Xs, N1, N).

between(Lower, Upper, X) :-
    prologue__integer(Lower),
    prologue__integer(Upper),
    prologue__integer_or_variable(X),
    prologue__between(Lower, Upper, X).

prologue__between(Lower, Upper, Lower) :- Lower =< Upper.
prologue__between(Lower, Upper, X) :-
    Lower < Upper,
    Next is Lower + 1,
    prologue__between(Next, Upper, X).

select(X, [X|Xs], Xs).
select(X, [Y|Ys], [Y|Zs]) :- select(X, Ys, Zs).

succ(X, S) :-
    var(X), !,
    ( var(S) -> 0 is S
    ; prologue__integer(S),
      prologue__not_less_than_zero(S),
      S > 0,
      X is S - 1
    ).
succ(X, S) :-
    prologue__integer(X),
    prologue__not_less_than_zero(X),
    ( var(S) -> S is X + 1
    ; prologue__integer(S),
      prologue__not_less_than_zero(S),
      S =:= X + 1
    ).

maplist(_, []).
maplist(Closure, [X|Xs]) :-
    call(Closure, X),
    maplist(Closure, Xs).

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

nth0(N, List, Elem) :- nth0(N, List, Elem, _).

nth0(N, List, Elem, Rest) :-
    prologue__integer_or_variable(N),
    ( var(N) -> prologue__nth0(N, List, Elem, Rest)
    ; prologue__not_less_than_zero(N),
      prologue__nth0(N, List, Elem, Rest)
    ).

prologue__nth0(0, [Elem|Rest], Elem, Rest).
prologue__nth0(N, [X|Xs], Elem, [X|Rest]) :-
    var(N),
    prologue__nth0(N0, Xs, Elem, Rest),
    N is N0 + 1.
prologue__nth0(N, [X|Xs], Elem, [X|Rest]) :-
    nonvar(N),
    N > 0,
    N0 is N - 1,
    prologue__nth0(N0, Xs, Elem, Rest).

nth1(N, List, Elem) :- nth1(N, List, Elem, _).

nth1(N, List, Elem, Rest) :-
    N \== 0,
    nth0(N, [_|List], Elem, [_|Rest]),
    N \== 0.

call_nth(Goal, Nth) :- eyeprolog__call_nth(Goal, Nth).

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

countall(Goal, Count) :-
    findall(1, Goal, Ones),
    length(Ones, Count).

prologue__integer_or_variable(X) :- var(X), !.
prologue__integer_or_variable(X) :- prologue__integer(X).

prologue__integer(X) :- integer(X), !.
prologue__integer(X) :- var(X), !, 0 is X.
% arg/3 performs the required integer type check before inspecting its term.
prologue__integer(X) :- arg(X, type_check, _).

prologue__not_less_than_zero(X) :- X >= 0, !.
% atom_length/2 reports domain_error(not_less_than_zero) for a negative value.
prologue__not_less_than_zero(X) :- atom_length('', X).
