% SPEC 9.6: atom and string built-ins.
answer(atom_concat, X) :- atom_concat(eye, log, X).
answer(str_concat, X) :- str_concat("eye", "log", X).
answer(contains, true) :- contains("eyelog", "log").
answer(not_contains, true) :- not_contains("eyelog", "cat").
