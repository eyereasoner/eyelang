/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   format_time//2 is reused from the common Scryer/Trealla library(time),
   written by Markus Triska.  Only current_time/1's platform adapter is
   EyeProlog-specific.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

/** Predicates for reasoning about time. */

:- module(time, [current_time/1, format_time//2]).

:- use_module(library(dcgs), [seq//1]).
:- use_module(library(error), [domain_error/3]).
:- use_module(library(lists), [member/2]).

current_time(T) :-
    eyeprolog__current_time(T).

format_time([], _) --> [].
format_time(['%','%'|Fs], T) --> !, ['%'], format_time(Fs, T).
format_time(['%',Spec|Fs], T) --> !,
    (   { member(Spec=Value, T) } ->
        seq(Value)
    ;   { domain_error(time_specifier, Spec, format_time//2) }
    ),
    format_time(Fs, T).
format_time([F|Fs], T) --> [F], format_time(Fs, T).
