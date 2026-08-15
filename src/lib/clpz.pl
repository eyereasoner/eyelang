/*  CLP(Z): Constraint Logic Programming over Integers.

    The public syntax and contracts follow Markus Triska's library(clpz), as
    distributed with Trealla Prolog under the MIT license. Copyright (C)
    2016-2026 Markus Triska. EyeProlog's implementation currently provides the
    finite-domain kernel listed in this module; additional Trealla global
    constraints will be added as their propagation semantics become available.
*/

:- module(clpz, [
    ('#>')/2,
    ('#<')/2,
    ('#>=')/2,
    ('#=<')/2,
    ('#=')/2,
    ('#\\=')/2,
    (#\\)/1,
    ('#<==>')/2,
    ('#==>')/2,
    ('#<==')/2,
    ('#\\/')/2,
    (#\\)/2,
    ('#/\\')/2,
    ('in')/2,
    ('ins')/2,
    all_different/1,
    all_distinct/1,
    nvalue/2,
    sum/3,
    scalar_product/4,
    tuples_in/2,
    labeling/2,
    label/1,
    indomain/1,
    lex_chain/1,
    serialized/2,
    global_cardinality/2,
    global_cardinality/3,
    circuit/1,
    chain/2,
    element/3,
    zcompare/3,
    fd_var/1,
    fd_inf/2,
    fd_sup/2,
    fd_size/2,
    fd_dom/2
]).

:- op(760, yfx, #<==>).
:- op(750, xfy, #==>).
:- op(750, yfx, #<==).
:- op(740, yfx, #\\/).
:- op(730, yfx, #\\).
:- op(720, yfx, #/\\).
:- op(710, fy, #\\).
:- op(700, xfx, #>).
:- op(700, xfx, #<).
:- op(700, xfx, #>=).
:- op(700, xfx, #=<).
:- op(700, xfx, #=).
:- op(700, xfx, #\\=).
:- op(700, xfx, in).
:- op(700, xfx, ins).
:- op(450, xfx, ..).

'#>'(Left, Right) :- eyeprolog__clpz_post('#>'(Left, Right)).
'#<'(Left, Right) :- eyeprolog__clpz_post('#<'(Left, Right)).
'#>='(Left, Right) :- eyeprolog__clpz_post('#>='(Left, Right)).
'#=<'(Left, Right) :- eyeprolog__clpz_post('#=<'(Left, Right)).
'#='(Left, Right) :- eyeprolog__clpz_post('#='(Left, Right)).
'#\\='(Left, Right) :- eyeprolog__clpz_post('#\\='(Left, Right)).
'#\\'(Constraint) :- eyeprolog__clpz_post('#\\'(Constraint)).
'#<==>'(Left, Right) :- eyeprolog__clpz_post('#<==>'(Left, Right)).
'#==>'(Left, Right) :- eyeprolog__clpz_post('#==>'(Left, Right)).
'#<=='(Left, Right) :- eyeprolog__clpz_post('#<=='(Left, Right)).
'#\\/'(Left, Right) :- eyeprolog__clpz_post('#\\/'(Left, Right)).
'#\\'(Left, Right) :- eyeprolog__clpz_post('#\\'(Left, Right)).
'#/\\'(Left, Right) :- eyeprolog__clpz_post('#/\\'(Left, Right)).

in(Integer, Domain) :- eyeprolog__clpz_in(Integer, Domain).
ins(Integers, Domain) :- eyeprolog__clpz_ins(Integers, Domain).

all_different(Integers) :- all_distinct(Integers).
all_distinct(Integers) :- eyeprolog__clpz_all_distinct(Integers).
nvalue(Count, Integers) :- eyeprolog__clpz_nvalue(Count, Integers).

sum(Integers, Relation, Value) :-
    eyeprolog__clpz_sum(Integers, Relation, Value).

scalar_product(Coefficients, Integers, Relation, Value) :-
    eyeprolog__clpz_scalar_product(Coefficients, Integers, Relation, Value).

tuples_in(Tuples, Relation) :- eyeprolog__clpz_tuples_in(Tuples, Relation).

labeling(Options, Integers) :-
    eyeprolog__clpz_labeling(Options, Integers).

label(Integers) :- labeling([], Integers).
indomain(Integer) :- labeling([], [Integer]).

lex_chain(Lists) :- eyeprolog__clpz_lex_chain(Lists).
serialized(Starts, Durations) :- eyeprolog__clpz_serialized(Starts, Durations).

global_cardinality(Integers, Pairs) :-
    global_cardinality(Integers, Pairs, []).
global_cardinality(Integers, Pairs, Options) :-
    eyeprolog__clpz_global_cardinality(Integers, Pairs, Options).

circuit(Integers) :- eyeprolog__clpz_circuit(Integers).
chain(Relation, Integers) :- eyeprolog__clpz_chain(Relation, Integers).
element(Index, Integers, Value) :-
    eyeprolog__clpz_element(Index, Integers, Value).
zcompare(Order, Left, Right) :- eyeprolog__clpz_zcompare(Order, Left, Right).

fd_var(Integer) :- eyeprolog__clpz_fd_var(Integer).
fd_inf(Integer, Infimum) :- eyeprolog__clpz_fd_inf(Integer, Infimum).
fd_sup(Integer, Supremum) :- eyeprolog__clpz_fd_sup(Integer, Supremum).
fd_size(Integer, Size) :- eyeprolog__clpz_fd_size(Integer, Size).
fd_dom(Integer, Domain) :- eyeprolog__clpz_fd_dom(Integer, Domain).
