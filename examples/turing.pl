% A Turing machine reads a tape, writes one symbol, and moves left or right.
% This machine adds one to a binary number. blank means an empty tape cell.
% A transition maps [machine, state, read] to [next-state, write, movement].
% Change an input list, or add another case using the same machine.
% The rules below run any machine described by this transition-table shape.
% A configuration is [state, reversed-left-tape, current-symbol, right-tape].
% [first | second] separates the first item from the rest of a list.
% Write the symbol and move right, extending the tape with blank if needed.
% Write the symbol and move left, extending the tape with blank if needed.
% A stay instruction writes without moving the head.
% On halt, turn the reversed left side around and join it to the rest.
% The trailing blank is a tape cell, not a binary digit.

% Prolog facts and rules.
start('add-one', scan).
transition(['add-one', scan, 0], [scan, 0, right]).
transition(['add-one', scan, 1], [scan, 1, right]).
transition(['add-one', scan, blank], [carry, blank, left]).
transition(['add-one', carry, 0], [halt, 1, stay]).
transition(['add-one', carry, 1], [carry, 0, left]).
transition(['add-one', carry, blank], [halt, 1, stay]).
machine(case1, 'add-one').
input(case1, [1, 0, 1, 0, 0, 1]).
machine(case2, 'add-one').
input(case2, [1, 0, 1, 1, 1, 1]).
machine(case3, 'add-one').
input(case3, [1, 1, 1, 1, 1, 1]).
machine(case4, 'add-one').
input(case4, []).

runs(Case, [State, [], Symbol, Rest]) :-
    machine(Case, Machine),
    start(Machine, State),
    input(Case, [Symbol | Rest]).
runs(Case, [State, [], blank, []]) :-
    machine(Case, Machine),
    start(Machine, State),
    input(Case, []).
runs(Case, [NextState, [Write | Left], NextSymbol, Right]) :-
    runs(Case, [State, Left, Read, [NextSymbol | Right]]),
    machine(Case, Machine),
    transition([Machine, State, Read], [NextState, Write, right]).
runs(Case, [NextState, [Write | Left], blank, []]) :-
    runs(Case, [State, Left, Read, []]),
    machine(Case, Machine),
    transition([Machine, State, Read], [NextState, Write, right]).
runs(Case, [NextState, Left, Previous, [Write | Right]]) :-
    runs(Case, [State, [Previous | Left], Read, Right]),
    machine(Case, Machine),
    transition([Machine, State, Read], [NextState, Write, left]).
runs(Case, [NextState, [], blank, [Write | Right]]) :-
    runs(Case, [State, [], Read, Right]),
    machine(Case, Machine),
    transition([Machine, State, Read], [NextState, Write, left]).
runs(Case, [NextState, Left, Write, Right]) :-
    runs(Case, [State, Left, Read, Right]),
    machine(Case, Machine),
    transition([Machine, State, Read], [NextState, Write, stay]).
'unfinished-output'(Case, [Left, [Symbol | Right]]) :-
    runs(Case, [halt, Left, Symbol, Right]).
'unfinished-output'(Case, [Left, [Symbol | Right]]) :-
    'unfinished-output'(Case, [[Symbol | Left], Right]).
output(Case, Output) :-
    'unfinished-output'(Case, [[], Output]).
is_a(Case, 'finished-case') :-
    output(Case, Output).

% Answer and Reason
?- input(case1, What).
?- input(case2, What).
?- input(case3, What).
?- input(case4, What).
?- output(case1, What).
?- output(case2, What).
?- output(case3, What).
?- output(case4, What).
?- why.
?- is_a(Who, 'finished-case').

% Check
:- assertion((output(case1, [1, 0, 1, 0, 1, 0, blank]))).
:- assertion((output(case2, [1, 1, 0, 0, 0, 0, blank]))).
:- assertion((output(case3, [1, 0, 0, 0, 0, 0, 0, blank]))).
:- assertion((output(case4, [1, blank]))).
:- assertion((aggregate_all(count, is_a(Subject, 'finished-case'), 4))).
