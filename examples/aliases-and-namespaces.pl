% Short eyelog names and namespaced Eyeling-style aliases call the same built-ins.
% The colon is just part of the predicate name, used as a vocabulary prefix.

triple(:shortMath, :value, X) :- sum(0.125, 0.875, X).
triple(:namespaceMath, :value, X) :- math:sum(0.125, 0.875, X).

triple(:shortCompare, :ok, true) :- less_than(2, 3).
triple(:namespaceCompare, :ok, true) :- math:lessThan(2, 3).

triple(:shortString, :ok, true) :- matches("scoped retail insight", "retail|medical").
triple(:namespaceString, :ok, true) :- string:matches("scoped retail insight", "retail|medical").

triple(:shortList, :tail, Tail) :- rest([a, b, c], Tail).
triple(:namespaceList, :tail, Tail) :- list:rest([a, b, c], Tail).
