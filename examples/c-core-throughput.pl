% C-core throughput demonstration.
%
% This intentionally small program materializes many generated relations from a
% compact rule set. It exercises the hot path that makes Eyelog a good fit for
% C: range generation, atom construction, integer arithmetic, unification,
% duplicate suppression, and formatted relation-style output.
%
% Run a local timing check with:
%
%   make
%   /usr/bin/time -f "%e sec  %M KB" bin/eyelog examples/c-core-throughput.pl > /tmp/eyelog-throughput.out
%   wc -l /tmp/eyelog-throughput.out
%
% The default scale is test-friendly. Increase throughput_rows/1 to 100000 for
% a larger local run.

materialize(type, 2).
materialize(ordinal, 2).
materialize(square, 2).
materialize(checksum97, 2).
materialize(rows, 2).
materialize(relationsPerRow, 2).
materialize(expectedMaterializedRelations, 2).
materialize(firstRow, 2).
materialize(lastRow, 2).
materialize(message, 2).
materialize(is, 2).

throughput_rows(10000).

generated_row(N, Id) :-
  throughput_rows(Max),
  between(1, Max, N),
  atom_concat(row, N, Id).

type(Id, generatedRow) :-
  generated_row(_, Id).

ordinal(Id, N) :-
  generated_row(N, Id).

square(Id, Square) :-
  generated_row(N, Id),
  mul(N, N, Square).

checksum97(Id, Checksum) :-
  generated_row(N, Id),
  mul(N, N, Square),
  mod(Square, 97, Checksum).

rows(report, Max) :-
  throughput_rows(Max).

relationsPerRow(report, 4).

expectedMaterializedRelations(report, Total) :-
  throughput_rows(Max),
  mul(Max, 4, RowRelations),
  add(RowRelations, 7, Total).

firstRow(report, row1).

lastRow(report, Last) :-
  throughput_rows(Max),
  atom_concat(row, Max, Last).

message(report, "Tiny source, many derived relations: this is the C core hot path.").

is(test, true) :-
  throughput_rows(Max),
  atom_concat(row, Max, Last),
  checksum97(Last, _Checksum).
