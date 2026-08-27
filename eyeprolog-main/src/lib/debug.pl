/** Compatibility hooks and declarative debugging.

    The three operator predicates are reused from the identical Scryer and
    Trealla library(debug) sources. The blackboard operations are retained for
    the constraint libraries.
*/

:- module(debug, [debug/1, debug/3, nodebug/1, bb_get/2, bb_put/2, bb_b_put/2,
                  bb_global_get/2,
                  op(900, fx, $), op(900, fx, $-), op(950, fy, *),
                  (*)/1, ($)/1, ($-)/1]).

:- op(900, fx, $).
:- op(900, fx, $-).
:- op(950, fy, *).

:- use_module(library(format), [portray_clause/1]).

:- meta_predicate(debug(+, +, +)).
:- meta_predicate(*(0)).
:- meta_predicate($(0)).
:- meta_predicate($-(0)).

debug(_).
debug(_, _, _).
nodebug(_).

$-(Goal) :-
    catch(Goal, Exception,
          ( portray_clause(exception:Exception:Goal), throw(Exception) )).

$(Goal) :-
    portray_clause(call:Goal),
    $-Goal,
    portray_clause(exit:Goal).

*(_).

bb_get(Key, Value) :- eyeprolog__bb_get(Key, Value), !.
bb_get(Key, Value) :- eyeprolog__bb_global_get(Key, Value).
bb_global_get(Key, Value) :- eyeprolog__bb_global_get(Key, Value).
bb_put(Key, Value) :- eyeprolog__bb_global_put(Key, Value).
bb_b_put(Key, Value) :- eyeprolog__bb_b_put(Key, Value).
