% Allen interval calculus adapted from Eyeling allen-interval-calculus.n3.
% Eyeling demonstrates dateTime and duration built-ins; this eyelog version
% uses integer hour offsets so the interval rules remain pure Horn clauses.

interval(:A). start(:A, 10). end(:A, 12).
interval(:B). start(:B, 13). end(:B, 15).
interval(:C). start(:C, 12). end(:C, 14).
interval(:D). start(:D, 11). end(:D, 13).
interval(:E). start(:E, 10). end(:E, 12).
interval(:F). start(:F, 10). end(:F, 11).
interval(:G). start(:G, 11). end(:G, 12).
interval(:H). start(:H, 9).  end(:H, 16).
interval(:I). start(:I, 16). end(:I, 18).
interval(:J). start(:J, 15). end(:J, 16).
interval(:K). start(:K, 13). end(:K, 14).

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
