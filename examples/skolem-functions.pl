% Skolem functional terms in rule heads.
%
% A generated resource should be deterministic and collision-free. Use a
% function symbol whose arguments contain the values that make the resource
% unique, such as skolem_observation(Patient, Test).

materialize(type, 2).
materialize(patient, 2).
materialize(test, 2).
materialize(value, 2).
materialize(about, 2).
materialize(sameInputsSameId, 2).
materialize(noObservationClash, 2).

test_result(alice, glucose, 6.8).
test_result(alice, cholesterol, 4.2).
test_result(bob, glucose, 5.1).

high_glucose(Patient) :-
  test_result(Patient, glucose, Value),
  gt(Value, 6.0).

observation_id(Patient, Test, skolem_observation(Patient, Test)) :-
  test_result(Patient, Test, _Value).

type(skolem_observation(Patient, Test), observation) :-
  test_result(Patient, Test, _Value).

patient(skolem_observation(Patient, Test), Patient) :-
  test_result(Patient, Test, _Value).

test(skolem_observation(Patient, Test), Test) :-
  test_result(Patient, Test, _Value).

value(skolem_observation(Patient, Test), Value) :-
  test_result(Patient, Test, Value).

type(skolem_alert(Patient, glucose), highGlucoseAlert) :-
  high_glucose(Patient).

about(skolem_alert(Patient, glucose), skolem_observation(Patient, glucose)) :-
  high_glucose(Patient).

sameInputsSameId(skolemDemo, true) :-
  eq(skolem_observation(alice, glucose), skolem_observation(alice, glucose)).

noObservationClash(skolemDemo, true) :-
  neq(skolem_observation(alice, glucose), skolem_observation(alice, cholesterol)),
  neq(skolem_observation(alice, glucose), skolem_observation(bob, glucose)).
