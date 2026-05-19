triple(skolemDemo, noObservationClash, true).
triple(skolemDemo, sameInputsSameId, true).
triple(skolem_alert(alice, glucose), about, skolem_observation(alice, glucose)).
triple(skolem_alert(alice, glucose), rdf_type, highGlucoseAlert).
triple(skolem_observation(alice, cholesterol), patient, alice).
triple(skolem_observation(alice, cholesterol), rdf_type, observation).
triple(skolem_observation(alice, cholesterol), test, cholesterol).
triple(skolem_observation(alice, cholesterol), value, 4.2).
triple(skolem_observation(alice, glucose), patient, alice).
triple(skolem_observation(alice, glucose), rdf_type, observation).
triple(skolem_observation(alice, glucose), test, glucose).
triple(skolem_observation(alice, glucose), value, 6.8).
triple(skolem_observation(bob, glucose), patient, bob).
triple(skolem_observation(bob, glucose), rdf_type, observation).
triple(skolem_observation(bob, glucose), test, glucose).
triple(skolem_observation(bob, glucose), value, 5.1).
