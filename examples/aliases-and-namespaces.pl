% Built-ins use one native spelling each.
% Vocabulary predicate names remain ordinary user predicates.

triple(nativeMath, value, X) :- add(0.125, 0.875, X).
triple(nativeCompare, ok, true) :- lt(2, 3).
triple(nativeString, ok, true) :- matches("scoped retail insight", "retail|medical").
triple(nativeList, tail, Tail) :- rest([a, b, c], Tail).

example_label(vocabularyExample, "vocabulary names are ordinary predicate names").
triple(vocabularyExample, label, Text) :- example_label(vocabularyExample, Text).
