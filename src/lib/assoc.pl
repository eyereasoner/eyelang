/** Minimal Scryer-compatible association maps.

    The public operations used by library(clpz) are represented as a sorted
    list wrapped in assoc/1.  The representation is intentionally private: the
    predicates preserve the observable assoc contracts while keeping the
    compatibility layer small and declarative.
*/

:- module(assoc, [
    empty_assoc/1,
    assoc_to_list/2,
    get_assoc/3,
    put_assoc/4
]).

empty_assoc(assoc([])).

assoc_to_list(assoc(Pairs), Pairs).

get_assoc(Key, assoc(Pairs), Value) :-
    assoc__get(Pairs, Key, Value).

assoc__get([K-V|Pairs], Key, Value) :-
    compare(Order, Key, K),
    assoc__get(Order, Key, Value, V, Pairs).

assoc__get(=, _, Value, Value, _).
assoc__get(>, Key, Value, _, Pairs) :-
    assoc__get(Pairs, Key, Value).

put_assoc(Key, assoc(Pairs0), Value, assoc(Pairs)) :-
    assoc__put(Pairs0, Key, Value, Pairs).

assoc__put([], Key, Value, [Key-Value]).
assoc__put([K-V|Pairs0], Key, Value, Pairs) :-
    compare(Order, Key, K),
    assoc__put(Order, Key, Value, K, V, Pairs0, Pairs).

assoc__put(=, Key, Value, _, _, Pairs, [Key-Value|Pairs]).
assoc__put(<, Key, Value, K, V, Pairs, [Key-Value,K-V|Pairs]).
assoc__put(>, Key, Value, K, V, Pairs0, [K-V|Pairs]) :-
    assoc__put(Pairs0, Key, Value, Pairs).
