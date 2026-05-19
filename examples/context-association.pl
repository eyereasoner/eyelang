% Named graph context association adapted from Eyeling context-association.n3.
% Data, signature, and metadata contexts are graph-valued terms.

named_graph(:DataGraph, graph([
  statement(:Bob, foaf:name, "Bob")
])).

named_graph(:SignatureGraph, graph([
  statement(:DataGraph, sec:proof, :DataSignature),
  statement(:Proof1, rdf:type, sec:DataIntegrityProof),
  statement(:Proof1, sec:cryptosuite, "ecdsa-rdfc-2019"),
  statement(:Proof1, sec:issuer, :University),
  statement(:Proof1, sec:validUntil, "2025-04-03T00:00:00.000Z")
])).

named_graph(:MetadataGraph, graph([
  statement(:SignatureGraph, sec:proof, :MetadataSignature),
  statement(:MetadataProof, rdf:type, sec:DataIntegrityProof),
  statement(:MetadataProof, sec:proofPurpose, "assertionMethod")
])).

graph_statement(graph(Statements), Subject, Predicate, Object) :-
  member(statement(Subject, Predicate, Object), Statements).

context_includes(GraphName, Subject, Predicate, Object) :-
  named_graph(GraphName, Graph),
  graph_statement(Graph, Subject, Predicate, Object).

context_association_verified(:association) :-
  context_includes(:DataGraph, :Bob, foaf:name, "Bob"),
  context_includes(:SignatureGraph, :DataGraph, sec:proof, :DataSignature),
  context_includes(:SignatureGraph, :Proof1, rdf:type, sec:DataIntegrityProof),
  context_includes(:SignatureGraph, :Proof1, sec:cryptosuite, "ecdsa-rdfc-2019"),
  context_includes(:SignatureGraph, :Proof1, sec:issuer, :University),
  context_includes(:MetadataGraph, :SignatureGraph, sec:proof, :MetadataSignature),
  context_includes(:MetadataGraph, :MetadataProof, rdf:type, sec:DataIntegrityProof),
  context_includes(:MetadataGraph, :MetadataProof, sec:proofPurpose, "assertionMethod").

triple(GraphName, log:nameOf, Graph) :- named_graph(GraphName, Graph).
triple(:association, :subject, :Bob) :- context_association_verified(:association).
triple(:association, :dataGraph, :DataGraph) :- context_association_verified(:association).
triple(:association, :signatureGraph, :SignatureGraph) :- context_association_verified(:association).
triple(:association, :metadataGraph, :MetadataGraph) :- context_association_verified(:association).
triple(:association, :cryptosuite, "ecdsa-rdfc-2019") :- context_association_verified(:association).
triple(:association, :issuer, :University) :- context_association_verified(:association).
triple(:association, :status, :contextAssociationVerified) :- context_association_verified(:association).
