% SPEC 9.6: atom and string built-ins.
answer(atom_concat, X) :- atom_concat(s, ee, X).
answer(str_concat, X) :- str_concat("s", "ee", X).
answer(contains, true) :- contains("see", "ee").
answer(not_contains, true) :- not_contains("see", "cat").
