/** Predicates proposed by the ISO Prolog Prologue working draft. */

:- module(prologue, [
    member/2,
    append/3,
    length/2,
    between/3,
    select/3,
    succ/2,
    maplist/2
]).

:- meta_predicate(maplist(1, '?')).

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

prologue__integer_or_variable(X) :- var(X), !.
prologue__integer_or_variable(X) :- prologue__integer(X).

prologue__integer(X) :- integer(X), !.
prologue__integer(X) :- var(X), !, 0 is X.
% arg/3 performs the required integer type check before inspecting its term.
prologue__integer(X) :- arg(X, type_check, _).

prologue__not_less_than_zero(X) :- X >= 0, !.
% atom_length/2 reports domain_error(not_less_than_zero) for a negative value.
prologue__not_less_than_zero(X) :- atom_length('', X).
