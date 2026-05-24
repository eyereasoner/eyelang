about(skolem_alert(alice, glucose), skolem_observation(alice, glucose)).
noObservationClash(skolemDemo, true).
patient(skolem_observation(alice, cholesterol), alice).
patient(skolem_observation(alice, glucose), alice).
patient(skolem_observation(bob, glucose), bob).
sameInputsSameId(skolemDemo, true).
test(skolem_observation(alice, cholesterol), cholesterol).
test(skolem_observation(alice, glucose), glucose).
test(skolem_observation(bob, glucose), glucose).
type(skolem_alert(alice, glucose), highGlucoseAlert).
type(skolem_observation(alice, cholesterol), observation).
type(skolem_observation(alice, glucose), observation).
type(skolem_observation(bob, glucose), observation).
value(skolem_observation(alice, cholesterol), 4.2).
value(skolem_observation(alice, glucose), 6.8).
value(skolem_observation(bob, glucose), 5.1).
