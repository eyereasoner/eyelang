triple(:Charly, rdf:type, :Dog).
triple(:Minka, rdf:type, :Cat).
triple(:test, :is, true).
triple(triple(var(:y), rdf:type, :Dog), log:implies, triple(:test, :is, true)).
