/** High-level character I/O shared by Scryer and Trealla. */

:- module(charsio, [
    char_type/2,
    get_line_to_chars/3,
    get_single_char/1,
    get_n_chars/3,
    read_from_chars/2,
    read_term_from_chars/3,
    write_term_to_chars/3,
    chars_base64/3
]).

:- use_module(library(error), [can_be/2]).
:- use_module(library(lists), [length/2]).

char_type(Char, Type) :- eyeprolog__char_type(Char, Type).

get_single_char(Char) :- get_char(Char).

get_line_to_chars(Stream, Chars0, Chars) :-
    get_char(Stream, Char),
    (   Char == end_of_file -> Chars0 = Chars
    ;   Chars0 = [Char|Rest],
        ( Char == '\n' -> Rest = Chars
        ; get_line_to_chars(Stream, Rest, Chars)
        )
    ).

get_n_chars(Stream, N, Chars) :-
    can_be(integer, N),
    (   var(N) ->
        charsio__to_eof(Stream, Chars),
        length(Chars, N)
    ;   N >= 0,
        charsio__count(Stream, N, Chars)
    ).

charsio__count(_, 0, []) :- !.
charsio__count(Stream, N, Chars) :-
    N > 0,
    get_char(Stream, Char),
    (   Char == end_of_file -> Chars = []
    ;   Chars = [Char|Rest],
        N1 is N - 1,
        charsio__count(Stream, N1, Rest)
    ).

charsio__to_eof(Stream, Chars) :-
    get_char(Stream, Char),
    (   Char == end_of_file -> Chars = []
    ;   Chars = [Char|Rest], charsio__to_eof(Stream, Rest)
    ).


read_from_chars(Chars, Term) :-
    eyeprolog__read_from_chars(Chars, Term).

read_term_from_chars(Chars, Term, Options) :-
    eyeprolog__read_term_from_chars(Chars, Term, Options).

write_term_to_chars(Term, Options, Chars) :-
    eyeprolog__write_term_to_chars(Term, Options, Chars).

chars_base64(Chars, Base64, Options) :-
    eyeprolog__chars_base64(Chars, Base64, Options).
