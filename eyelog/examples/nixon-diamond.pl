% Nixon diamond: two independent defaults support incompatible conclusions.
% This mirrors the classic EYE reasoning theme while keeping the conclusion explicit:
% a subject with both defaults is reported as conflicted rather than forced to
% choose one extension.

materialize(defaultSupports, 2).
materialize(conflict, 2).
materialize(status, 2).

kind(nixon, quaker).
kind(nixon, republican).

supports_default(Person, pacifist) :-
  kind(Person, quaker).

supports_default(Person, hawk) :-
  kind(Person, republican).

contrary(pacifist, hawk).
contrary(hawk, pacifist).

conflicted(Person, A, B) :-
  supports_default(Person, A),
  supports_default(Person, B),
  contrary(A, B).

defaultSupports(Person, Conclusion) :-
  supports_default(Person, Conclusion).

conflict(Person, conflict(A, B)) :-
  conflicted(Person, A, B).

status(Person, conflicted_default_case) :-
  conflicted(Person, _A, _B).
