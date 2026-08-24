/** Small format/2 compatibility layer covering the controls used by CLP(Z). */

:- module(format, [format/2]).

format(Template, Arguments) :-
    format__chars(Template, Chars),
    format__emit(Chars, Arguments).

format__chars(Template, Chars) :-
    atom(Template), !,
    atom_chars(Template, Chars).
format__chars(Chars, Chars).

format__emit([], []).
format__emit(['~','~'|Chars], Args) :- !,
    put_char('~'),
    format__emit(Chars, Args).
format__emit(['~',n|Chars], Args) :- !,
    nl,
    format__emit(Chars, Args).
format__emit(['~',w|Chars], [Arg|Args]) :- !,
    write(Arg),
    format__emit(Chars, Args).
format__emit(['~',q|Chars], [Arg|Args]) :- !,
    writeq(Arg),
    format__emit(Chars, Args).
format__emit(['~',a|Chars], [Arg|Args]) :- !,
    write(Arg),
    format__emit(Chars, Args).
format__emit(['~',d|Chars], [Arg|Args]) :- !,
    write(Arg),
    format__emit(Chars, Args).
format__emit([Char|Chars], Args) :-
    put_char(Char),
    format__emit(Chars, Args).
