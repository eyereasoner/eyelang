/** Trealla/Scryer common filesystem relations.

Paths are represented as lists of characters, matching Scryer's library(files)
and EyeProlog's default double_quotes=chars profile. The exported surface is the
intersection currently documented by both Trealla and Scryer.
*/

:- module(files, [
    directory_files/2,
    delete_file/1,
    rename_file/2,
    make_directory/1,
    make_directory_path/1,
    working_directory/2
]).

:- use_module(library(error), [can_be/2]).

files__chars([]).
files__chars([C|Cs]) :- atom(C), atom_length(C, 1), files__chars(Cs).

files__must_be_chars(Term) :-
    ( var(Term) -> throw(error(instantiation_error, files))
    ; files__chars(Term) -> true
    ; throw(error(type_error(list, Term), files))
    ).

directory_files(Directory, Files) :-
    files__must_be_chars(Directory),
    can_be(list, Files),
    eyeprolog__directory_files(Directory, Files).

delete_file(File) :-
    files__must_be_chars(File),
    eyeprolog__delete_file(File).

rename_file(File, Renamed) :-
    files__must_be_chars(File),
    files__must_be_chars(Renamed),
    eyeprolog__rename_file(File, Renamed).

make_directory(Directory) :-
    files__must_be_chars(Directory),
    eyeprolog__make_directory(Directory).

make_directory_path(Directory) :-
    files__must_be_chars(Directory),
    eyeprolog__make_directory_path(Directory).

working_directory(Directory0, Directory) :-
    can_be(list, Directory0),
    can_be(list, Directory),
    eyeprolog__working_directory(Directory0, Directory).
