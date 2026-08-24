/** Attributed-variable implementation of Scryer-compatible freeze/2. */

:- module(freeze, [freeze/2]).

:- use_module(library(atts)).
:- meta_predicate(freeze(-, 0)).
:- attribute frozen/1.

verify_attributes(Var, Other, Goals) :-
    get_atts(Var, frozen(FrozenA)), !,
    ( var(Other) ->
        ( get_atts(Other, frozen(FrozenB)) ->
            put_atts(Other, frozen((FrozenB,FrozenA)))
        ; put_atts(Other, frozen(FrozenA))
        ),
        Goals = []
    ; Goals = [FrozenA]
    ).
verify_attributes(_, _, []).

freeze(X, Goal) :-
    put_atts(Fresh, frozen(Goal)),
    Fresh = X.

attribute_goals(Var) -->
    { get_atts(Var, frozen(Goals)),
      put_atts(Var, -frozen(_)) },
    [freeze:freeze(Var, Goals)].
