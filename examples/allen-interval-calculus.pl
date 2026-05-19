% Allen interval calculus adapted from Eyeling allen-interval-calculus.n3.
% Eyeling demonstrates dateTime and duration built-ins; this eyelog version
% uses integer hour offsets so the interval rules remain pure Horn clauses.
% The input interval table is a list of records, showing how tabular data can
% stay scoped as one term instead of many unrelated global start/end facts.

interval_table([
  interval(:A, 10, 12),
  interval(:B, 13, 15),
  interval(:C, 12, 14),
  interval(:D, 11, 13),
  interval(:E, 10, 12),
  interval(:F, 10, 11),
  interval(:G, 11, 12),
  interval(:H, 9, 16),
  interval(:I, 16, 18),
  interval(:J, 15, 16),
  interval(:K, 13, 14)
]).

interval(I) :- interval_table(Table), member(interval(I, _Start, _End), Table).
start(I, Start) :- interval_table(Table), member(interval(I, Start, _End), Table).
end(I, End) :- interval_table(Table), member(interval(I, _Start, End), Table).

relation(I, :before, J) :- end(I, EI), start(J, SJ), lt(EI, SJ).
relation(I, :meets, J) :- end(I, E), start(J, E).
relation(I, :overlaps, J) :-
  start(I, SI), end(I, EI),
  start(J, SJ), end(J, EJ),
  lt(SI, SJ), lt(SJ, EI), lt(EI, EJ).
relation(I, :starts, J) :-
  start(I, S), start(J, S),
  end(I, EI), end(J, EJ),
  lt(EI, EJ).
relation(I, :during, J) :-
  start(I, SI), end(I, EI),
  start(J, SJ), end(J, EJ),
  lt(SJ, SI), lt(EI, EJ).
relation(I, :finishes, J) :-
  end(I, E), end(J, E),
  start(I, SI), start(J, SJ),
  lt(SJ, SI).
relation(I, :equals, J) :-
  start(I, S), start(J, S),
  end(I, E), end(J, E).

relation(J, :after, I) :- relation(I, :before, J).
relation(J, :metBy, I) :- relation(I, :meets, J).
relation(J, :overlappedBy, I) :- relation(I, :overlaps, J).
relation(J, :startedBy, I) :- relation(I, :starts, J).
relation(J, :contains, I) :- relation(I, :during, J).
relation(J, :finishedBy, I) :- relation(I, :finishes, J).

duration(I, D) :- end(I, E), start(I, S), sub(E, S, D).

triple(I, :start, S) :- start(I, S).
triple(I, :end, E) :- end(I, E).
triple(I, :duration, D) :- duration(I, D).
triple(I, Rel, J) :- relation(I, Rel, J).
