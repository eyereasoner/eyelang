% Skolem functional terms in rule heads.
%
% A generated resource should be deterministic and collision-free. Use a
% function symbol whose arguments contain the values that make the resource
% unique, such as skolem:observation(Patient, Test).

test_result(:Alice, :glucose, 6.8).
test_result(:Alice, :cholesterol, 4.2).
test_result(:Bob, :glucose, 5.1).

high_glucose(Patient) :-
  test_result(Patient, :glucose, Value),
  gt(Value, 6.0).

observation_id(Patient, Test, skolem:observation(Patient, Test)) :-
  test_result(Patient, Test, _Value).

triple(skolem:observation(Patient, Test), rdf:type, :Observation) :-
  test_result(Patient, Test, _Value).

triple(skolem:observation(Patient, Test), :patient, Patient) :-
  test_result(Patient, Test, _Value).

triple(skolem:observation(Patient, Test), :test, Test) :-
  test_result(Patient, Test, _Value).

triple(skolem:observation(Patient, Test), :value, Value) :-
  test_result(Patient, Test, Value).

triple(skolem:alert(Patient, :glucose), rdf:type, :HighGlucoseAlert) :-
  high_glucose(Patient).

triple(skolem:alert(Patient, :glucose), :about, skolem:observation(Patient, :glucose)) :-
  high_glucose(Patient).

triple(:skolemDemo, :sameInputsSameId, true) :-
  eq(skolem:observation(:Alice, :glucose), skolem:observation(:Alice, :glucose)).

triple(:skolemDemo, :noObservationClash, true) :-
  neq(skolem:observation(:Alice, :glucose), skolem:observation(:Alice, :cholesterol)),
  neq(skolem:observation(:Alice, :glucose), skolem:observation(:Bob, :glucose)).
