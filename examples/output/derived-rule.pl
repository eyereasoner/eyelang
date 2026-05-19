triple(:Charly, rdf:type, :Dog).
triple(:Minka, rdf:type, :Cat).
triple(:test, :is, true).
triple(graph([triple(var(:y), rdf:type, :Dog)]), log:implies, graph([triple(:test, :is, true)])).
