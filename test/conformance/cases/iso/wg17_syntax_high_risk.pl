% High-risk ISO syntax/write regressions, independently derived from
% ISO/IEC 13211-1 clauses 6.3, 6.4 and 7.10 and cross-checked against the
% public WG17 conformity-testing syntax cases (#1, #14-15, #28-31, #33-34).

%% goal: wg17_numeric_escape
wg17_numeric_escape :-
    writeq('\7\'), nl.

%% goal: wg17_hex_escape
wg17_hex_escape :-
    writeq('\x21\'), nl.

%% goal: wg17_operator_arguments
wg17_operator_arguments :-
    writeq([:-,-]), nl,
    writeq(f(*)), nl,
    writeq(f(;,'|',';;')), nl.

%% goal: wg17_operator_precedence
wg17_operator_precedence :-
    writeq(a*(b+c)), nl,
    writeq((a :- b,c)), nl.

%% goal: wg17_canonical_list
wg17_canonical_list :-
    write_canonical([a]), nl.
