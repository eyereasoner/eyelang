% Skolem functional terms in rule heads.
%
% A generated resource should be deterministic and collision-free. Use a
% function symbol whose arguments contain the values that make the resource
% unique, such as skolem_observation(Patient, Test).

test_result(alice, glucose, 6.8).
test_result(alice, cholesterol, 4.2).
test_result(bob, glucose, 5.1).

high_glucose(Patient) :-
  test_result(Patient, glucose, Value),
  gt(Value, 6.0).

observation_id(Patient, Test, skolem_observation(Patient, Test)) :-
  test_result(Patient, Test, _Value).

triple(skolem_observation(Patient, Test), rdf_type, observation) :-
  test_result(Patient, Test, _Value).

triple(skolem_observation(Patient, Test), patient, Patient) :-
  test_result(Patient, Test, _Value).

triple(skolem_observation(Patient, Test), test, Test) :-
  test_result(Patient, Test, _Value).

triple(skolem_observation(Patient, Test), value, Value) :-
  test_result(Patient, Test, Value).

triple(skolem_alert(Patient, glucose), rdf_type, highGlucoseAlert) :-
  high_glucose(Patient).

triple(skolem_alert(Patient, glucose), about, skolem_observation(Patient, glucose)) :-
  high_glucose(Patient).

triple(skolemDemo, sameInputsSameId, true) :-
  eq(skolem_observation(alice, glucose), skolem_observation(alice, glucose)).

triple(skolemDemo, noObservationClash, true) :-
  neq(skolem_observation(alice, glucose), skolem_observation(alice, cholesterol)),
  neq(skolem_observation(alice, glucose), skolem_observation(bob, glucose)).
