% Validate data records by their functor and arity, then construct a result.
%
% =../2 exposes a term as [Functor | Arguments]. The same rule can inspect
% different record shapes without a separate decomposition clause for each
% functor. In the other direction it constructs a term from an atom name and
% an argument list. It never calls that term as a goal.

:- table member/2, length/2.

batch([temperature(room, 21), location(sensor, north, 3),
       location(sensor, north), unexpected(on)]).
schema(temperature, 2).
schema(location, 3).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
length([], 0).
length([_ | Rest], Count) :- length(Rest, Previous), Count is Previous + 1.

record_shape(Record, Name, Arity) :-
  batch(Records),
  member(Record, Records),
  Record =.. [Name | Arguments],
  length(Arguments, Arity).

accepted(Record) :-
  record_shape(Record, Name, Arity),
  schema(Name, Arity).
rejected(Record, Name, Arity) :-
  record_shape(Record, Name, Arity),
  \+ schema(Name, Arity).

receipt(Record, Receipt) :-
  accepted(Record),
  Record =.. [Name | Arguments],
  Receipt =.. [accepted_record, Name, Arguments].

% Answer and Reason
?- record_shape(Record, Name, Arity).
?- rejected(Record, Name, Arity).
?- why.
?- receipt(Record, Receipt).

% Check
:- assertion(accepted(temperature(room, 21))).
:- assertion(accepted(location(sensor, north, 3))).
:- assertion(rejected(location(sensor, north), location, 2)).
:- assertion(rejected(unexpected(on), unexpected, 1)).
:- assertion(aggregate_all(count, accepted(Record), 2)).
:- assertion(aggregate_all(count, rejected(Record, Name, Arity), 2)).
:- assertion(receipt(temperature(room, 21), accepted_record(temperature, [room, 21]))).
:- assertion(([a, b] =.. ['.', a, [b]])).
:- assertion((List =.. ['.', a, [b]], List = [a, b])).
:- assertion((Term =.. [reading, Value], Value = 42, Term = reading(42))).
