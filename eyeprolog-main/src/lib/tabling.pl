/** Common Scryer/Trealla tabling interface.

    EyeProlog detects and tables recursive user predicates automatically.  The
    explicit directive is therefore a source-compatible declaration, while
    start_tabling/2 delegates to the already selected execution strategy.
*/

:- module(tabling, [start_tabling/2, abolish_all_tables/0, op(1150, fx, table)]).

:- meta_predicate(start_tabling(?, 0)).

start_tabling(_, Worker) :-
    call(Worker).

abolish_all_tables :-
    eyeprolog__abolish_all_tables.
