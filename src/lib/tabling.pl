/** Common Scryer/Trealla tabling interface.

    EyeProlog tables predicates only when requested explicitly with
    `:- table ...`.  The library keeps the portable start_tabling/2 and
    abolish_all_tables/0 surface used by Scryer/Trealla-compatible source.
*/

:- module(tabling, [start_tabling/2, abolish_all_tables/0, op(1150, fx, table)]).

:- meta_predicate(start_tabling(?, 0)).

start_tabling(_, Worker) :-
    call(Worker).

abolish_all_tables :-
    eyeprolog__abolish_all_tables.
