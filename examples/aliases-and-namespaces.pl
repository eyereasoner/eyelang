% Built-ins use one native spelling each.
% Namespaced predicate names remain ordinary user vocabulary names.

triple(:nativeMath, :value, X) :- add(0.125, 0.875, X).
triple(:nativeCompare, :ok, true) :- lt(2, 3).
triple(:nativeString, :ok, true) :- matches("scoped retail insight", "retail|medical").
triple(:nativeList, :tail, Tail) :- rest([a, b, c], Tail).

example:label(:namespaceExample, "colon names are ordinary predicate names").
triple(:namespaceExample, :label, Text) :- example:label(:namespaceExample, Text).
