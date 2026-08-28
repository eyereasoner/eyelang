/** Widely implemented extensions to the ISO Prolog core. */

:- module(iso_ext, [
    call_nth/2,
    countall/2,
    forall/2,
    succ/2,
    cfor/3,
    findall/4,
    variant/2,
    time/1,
    '...'/2
]).

:- meta_predicate(call_nth(0, '?')).
:- meta_predicate(countall(0, '?')).
:- meta_predicate(forall(0, 0)).
:- meta_predicate(findall('?', 0, '?', '?')).
:- meta_predicate(time(0)).

% The organization and predicate contracts follow library(iso_ext) in
% Trealla. Most definitions use only EyeProlog's ISO profile. time/1 is the
% deliberate exception: its private adapter supplies monotonic host timing and
% writes the measurement while the public wrapper keeps normal meta semantics.

call_nth(Goal, Nth) :- eyeprolog__call_nth(Goal, Nth).

countall(Goal, Count) :- eyeprolog__countall(Goal, Count).

forall(Condition, Action) :-
    \+ (Condition, \+ Action).

succ(X, S) :-
    var(X), !,
    ( var(S) -> 0 is S
    ; iso_ext__integer(S),
      iso_ext__not_less_than_zero(S),
      S > 0,
      X is S - 1
    ).
succ(X, S) :-
    iso_ext__integer(X),
    iso_ext__not_less_than_zero(X),
    ( var(S) -> S is X + 1
    ; iso_ext__integer(S),
      iso_ext__not_less_than_zero(S),
      S =:= X + 1
    ).

cfor(LowerExpression, UpperExpression, Value) :-
    Lower is LowerExpression,
    Upper is UpperExpression,
    iso_ext__between(Lower, Upper, Value).

findall(Template, Goal, Bag, Tail) :-
    findall(Template, Goal, Prefix),
    iso_ext__append(Prefix, Tail, Bag),
    !.

variant(X, Y) :-
    copy_term(X-Y, CopyX-CopyY),
    subsumes_term(CopyX, CopyY),
    subsumes_term(CopyY, CopyX).

% Trealla-compatible timing wrapper. The private adapter measures the callable
% while this Prolog wrapper supplies normal module/meta-predicate semantics.
time(Goal) :- eyeprolog__time(Goal).

% Trealla/Scryer DCG helper: describes an arbitrary number of elements.
% EyeProlog's two-clause form has the same finite-input relation without the
% Trealla-specific empty-input cut guard, so recursive calls stay cut-free.
'...' --> [].
'...' --> [_], '...' .

iso_ext__call_all([]).
iso_ext__call_all([Goal|Goals]) :-
    call(Goal),
    iso_ext__call_all(Goals).

iso_ext__length([], N, N).
iso_ext__length([_|Xs], N0, N) :-
    N1 is N0 + 1,
    iso_ext__length(Xs, N1, N).

iso_ext__between(Lower, Upper, Lower) :- Lower =< Upper.
iso_ext__between(Lower, Upper, Value) :-
    Lower < Upper,
    Next is Lower + 1,
    iso_ext__between(Next, Upper, Value).

iso_ext__append([], Ys, Ys).
iso_ext__append([X|Xs], Ys, [X|Zs]) :- iso_ext__append(Xs, Ys, Zs).

iso_ext__integer(X) :- integer(X), !.
iso_ext__integer(X) :- var(X), !, 0 is X.
iso_ext__integer(X) :- arg(X, type_check, _).

iso_ext__not_less_than_zero(X) :- X >= 0, !.
iso_ext__not_less_than_zero(X) :- atom_length('', X).
