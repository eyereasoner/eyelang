% C-core throughput demonstration.
%
% This intentionally small program materializes many generated triples from a
% compact rule set. It exercises the hot path that makes Eyelog a good fit for
% C: range generation, atom construction, integer arithmetic, unification,
% duplicate suppression, and formatted RDF-shaped output.
%
% Run a local timing check with:
%
%   make
%   /usr/bin/time -f "%e sec  %M KB" bin/eyelog examples/c-core-throughput.pl > /tmp/eyelog-throughput.out
%   wc -l /tmp/eyelog-throughput.out
%
% The default scale is test-friendly. Increase throughput_rows/1 to 100000 for
% a larger local run.

throughput_rows(10000).

generated_row(N, Id) :-
  throughput_rows(Max),
  between(1, Max, N),
  atom_concat(row, N, Id).

triple(Id, rdf_type, generatedRow) :-
  generated_row(_, Id).

triple(Id, ordinal, N) :-
  generated_row(N, Id).

triple(Id, square, Square) :-
  generated_row(N, Id),
  mul(N, N, Square).

triple(Id, checksum97, Checksum) :-
  generated_row(N, Id),
  mul(N, N, Square),
  mod(Square, 97, Checksum).

triple(report, rows, Max) :-
  throughput_rows(Max).

triple(report, triplesPerRow, 4).

triple(report, expectedMaterializedTriples, Total) :-
  throughput_rows(Max),
  mul(Max, 4, RowTriples),
  add(RowTriples, 7, Total).

triple(report, firstRow, row1).

triple(report, lastRow, Last) :-
  throughput_rows(Max),
  atom_concat(row, Max, Last).

triple(report, message, "Tiny source, many derived triples: this is the C core hot path.").

triple(test, is, true) :-
  throughput_rows(Max),
  atom_concat(row, Max, Last),
  triple(Last, checksum97, _Checksum).
