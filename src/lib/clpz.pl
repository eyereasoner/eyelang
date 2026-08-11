/*  CLP(Z): Constraint Logic Programming over Integers.

    The public syntax and contracts follow Markus Triska's library(clpz), as
    distributed with Trealla Prolog under the MIT license. Copyright (C)
    2016-2026 Markus Triska. EyeProlog's implementation currently provides the
    finite-domain kernel listed in this module; additional Trealla global
    constraints will be added as their propagation semantics become available.
*/

:- module(clpz, [
    '#>'/2,
    '#<'/2,
    '#>='/2,
    '#=<'/2,
    '#='/2,
    '#\\='/2,
    (#\\)/1,
    '#<==>'/2,
    '#==>'/2,
    '#<=='/2,
    '#\\/'/2,
    (#\\)/2,
    '#/\\'/2,
    in/2,
    ins/2,
    all_different/1,
    all_distinct/1,
    sum/3,
    scalar_product/4,
    labeling/2,
    label/1,
    indomain/1,
    chain/2,
    element/3,
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

sum(Integers, Relation, Value) :-
    eyeprolog__clpz_sum(Integers, Relation, Value).

scalar_product(Coefficients, Integers, Relation, Value) :-
    eyeprolog__clpz_scalar_product(Coefficients, Integers, Relation, Value).

labeling(Options, Integers) :-
    eyeprolog__clpz_labeling(Options, Integers).

label(Integers) :- labeling([], Integers).
indomain(Integer) :- labeling([], [Integer]).

chain(Relation, Integers) :- eyeprolog__clpz_chain(Relation, Integers).
element(Index, Integers, Value) :-
    eyeprolog__clpz_element(Index, Integers, Value).

fd_var(Integer) :- eyeprolog__clpz_fd_var(Integer).
fd_inf(Integer, Infimum) :- eyeprolog__clpz_fd_inf(Integer, Infimum).
fd_sup(Integer, Supremum) :- eyeprolog__clpz_fd_sup(Integer, Supremum).
fd_size(Integer, Size) :- eyeprolog__clpz_fd_size(Integer, Size).
fd_dom(Integer, Domain) :- eyeprolog__clpz_fd_dom(Integer, Domain).
