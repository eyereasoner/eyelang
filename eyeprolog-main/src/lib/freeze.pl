/** Attributed-variable implementation of Scryer-compatible freeze/2. */

:- module(freeze, [freeze/2]).

:- use_module(library(atts)).
:- meta_predicate(freeze(-, 0)).
:- attribute frozen/1.

verify_attributes(Var, Other, Goals) :-
    get_atts(Var, frozen(FrozenA)), !,
    ( var(Other) ->
        ( get_atts(Other, frozen(FrozenB)) ->
            append_frozen(FrozenB, FrozenA, Frozen),
            put_atts(Other, frozen(Frozen))
        ; put_atts(Other, frozen(FrozenA))
        ),
        Goals = []
    ; Goals = FrozenA
    ).
verify_attributes(_, _, []).

freeze(X, Goal) :-
    put_atts(Fresh, frozen([Goal])),
    Fresh = X.

attribute_goals(Var) -->
    { get_atts(Var, frozen(Goals)),
      put_atts(Var, -frozen(_)) },
    frozen_attribute_goals(Goals, Var).

frozen_attribute_goals([], _) --> [].
frozen_attribute_goals([Goal|Goals], Var) -->
    [freeze:freeze(Var, Goal)],
    frozen_attribute_goals(Goals, Var).

append_frozen([], Tail, Tail).
append_frozen([Goal|Goals], Tail, [Goal|Merged]) :-
    append_frozen(Goals, Tail, Merged).
