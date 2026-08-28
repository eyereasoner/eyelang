/** Attributed-variable implementation of Scryer-compatible freeze/2. */

:- module(freeze, [freeze/2]).

:- use_module(library(atts)).
:- meta_predicate(freeze(-, 0)).
:- attribute frozen/1.

% Store suspensions as a binary join tree. Merging two attributed variables is
% therefore O(1); flattening is deferred until wakeup or residual projection.
% The solver meta-invokes every goal returned by verify_attributes/3, preserving
% one opaque cut boundary per original freeze/2 suspension.

verify_attributes(Var, Other, Goals) :-
    get_atts(Var, frozen(FrozenA)), !,
    ( var(Other) ->
        ( get_atts(Other, frozen(FrozenB)) ->
            put_atts(Other, frozen(frozen_join(FrozenB, FrozenA)))
        ; put_atts(Other, frozen(FrozenA))
        ),
        Goals = []
    ; frozen_goals(FrozenA, Goals)
    ).
verify_attributes(_, _, []).

freeze(X, Goal) :-
    put_atts(Fresh, frozen(frozen_goal(Goal))),
    Fresh = X.

frozen_goals(Frozen, Goals) :-
    frozen_goals(Frozen, Goals, []).

frozen_goals(frozen_goal(Goal), [Goal|Tail], Tail).
frozen_goals(frozen_join(Left, Right), Goals0, Goals) :-
    frozen_goals(Left, Goals0, Goals1),
    frozen_goals(Right, Goals1, Goals).

attribute_goals(Var) -->
    { get_atts(Var, frozen(Frozen)),
      put_atts(Var, -frozen(_)) },
    frozen_attribute_goals(Frozen, Var).

frozen_attribute_goals(frozen_goal(Goal), Var) -->
    [freeze:freeze(Var, Goal)].
frozen_attribute_goals(frozen_join(Left, Right), Var) -->
    frozen_attribute_goals(Left, Var),
    frozen_attribute_goals(Right, Var).
