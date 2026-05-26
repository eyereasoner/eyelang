% Built-ins use one native spelling each.
% Vocabulary predicate names remain ordinary user predicates.

materialize(value, 2).
materialize(ok, 2).
materialize(tail, 2).
materialize(label, 2).

value(nativeMath, X) :- add(0.125, 0.875, X).
ok(nativeCompare, true) :- lt(2, 3).
ok(nativeString, true) :- matches("scoped retail insight", "retail|medical").
tail(nativeList, Tail) :- rest([a, b, c], Tail).

example_label(vocabularyExample, "vocabulary names are ordinary predicate names").
label(vocabularyExample, Text) :- example_label(vocabularyExample, Text).
