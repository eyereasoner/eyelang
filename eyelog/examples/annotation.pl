% Annotation with quoted formula data.
%
% The program keeps the annotation as data and derives visible relations from it.
% Formula members become default output only when explicit rules project them.

materialize(name, 2).
materialize(log_nameOf, 2).
materialize(statedBy, 2).
materialize(recorded, 2).

annotation(t, (
  name(a, "Alice"),
  statedBy(t, bob),
  recorded(t, "2021-07-07")
)).

name(S, O) :-
  annotation(_T, Formula),
  formula_binary(Formula, S, name, O).

log_nameOf(T, name(S, O)) :-
  annotation(T, Formula),
  formula_binary(Formula, S, name, O).

statedBy(S, O) :-
  annotation(_T, Formula),
  formula_binary(Formula, S, statedBy, O).

recorded(S, O) :-
  annotation(_T, Formula),
  formula_binary(Formula, S, recorded, O).
