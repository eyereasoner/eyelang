/** Compatibility hooks for Scryer libraries.

    CLP(Z) only needs the backtrackable blackboard operations; the debugging
    predicates are deliberately harmless no-ops unless EyeProlog grows a debug
    topic UI later.
*/

:- module(debug, [debug/1, debug/3, nodebug/1, bb_get/2, bb_b_put/2]).

:- meta_predicate(debug(+, +, +)).

debug(_).
debug(_, _, _).
nodebug(_).

bb_get(Key, Value) :- eyeprolog__bb_get(Key, Value).
bb_b_put(Key, Value) :- eyeprolog__bb_b_put(Key, Value).
