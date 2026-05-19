triple(:skolemDemo, :noObservationClash, true).
triple(:skolemDemo, :sameInputsSameId, true).
triple(skolem:alert(:Alice, :glucose), :about, skolem:observation(:Alice, :glucose)).
triple(skolem:alert(:Alice, :glucose), rdf:type, :HighGlucoseAlert).
triple(skolem:observation(:Alice, :cholesterol), :patient, :Alice).
triple(skolem:observation(:Alice, :cholesterol), :test, :cholesterol).
triple(skolem:observation(:Alice, :cholesterol), :value, 4.2).
triple(skolem:observation(:Alice, :cholesterol), rdf:type, :Observation).
triple(skolem:observation(:Alice, :glucose), :patient, :Alice).
triple(skolem:observation(:Alice, :glucose), :test, :glucose).
triple(skolem:observation(:Alice, :glucose), :value, 6.8).
triple(skolem:observation(:Alice, :glucose), rdf:type, :Observation).
triple(skolem:observation(:Bob, :glucose), :patient, :Bob).
triple(skolem:observation(:Bob, :glucose), :test, :glucose).
triple(skolem:observation(:Bob, :glucose), :value, 5.1).
triple(skolem:observation(:Bob, :glucose), rdf:type, :Observation).
