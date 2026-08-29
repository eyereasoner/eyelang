% Eyelet forward-reasoning support for EyeProlog.
%
% The :+/2 closure itself is executed natively by EyeProlog.  This module owns
% the two state helpers used by Eyelet programs and exports the :+ operator so
% source files can opt into the complete surface with one use_module/1.

:- module(eyelet, [op(1200, xfx, :+), stable/1, becomes/2]).

:- use_module(library(iso_ext), [forall/2]).
:- use_module(library(lists), [member/2]).

:- meta_predicate(becomes(0, 0)).

% stable(+Level)
% Fail until the native forward-rule driver has reached the requested closure
% level.  Asking for a higher level extends the driver's target limit.
stable(Level) :-
    call(user:limit(Limit)),
    (   Limit < Level
    ->  user:retract(limit(Limit)),
        user:assertz(limit(Level))
    ;   true
    ),
    call(user:closure(Closure)),
    Level =< Closure.

% becomes(:From, :To)
% Linear implication over dynamic state: prove and retract every conjunct in
% From, then assert every conjunct in To.
becomes(From, To) :-
    catch(call(user:From), _, fail),
    conj_list(From, Old),
    forall(member(Clause, Old), user:retract(Clause)),
    conj_list(To, New),
    forall(member(Clause, New), user:assertz(Clause)).

conj_list(true, []).
conj_list(Goal, [Goal]) :-
    Goal \= (_, _),
    Goal \= false,
    !.
conj_list((A, B), [A|Rest]) :-
    conj_list(B, Rest).
