% SPEC 9.6: atom_concat/3 and str_concat/3 concatenate like-typed scalars.
answer(atom, X) :- atom_concat(eye, log, X).
answer(string, X) :- str_concat("eye", "log", X).
