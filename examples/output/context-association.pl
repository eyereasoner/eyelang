triple(:DataGraph, log:nameOf, graph([statement(:Bob, foaf:name, "Bob")])).
triple(:MetadataGraph, log:nameOf, graph([statement(:SignatureGraph, sec:proof, :MetadataSignature), statement(:MetadataProof, rdf:type, sec:DataIntegrityProof), statement(:MetadataProof, sec:proofPurpose, "assertionMethod")])).
triple(:SignatureGraph, log:nameOf, graph([statement(:DataGraph, sec:proof, :DataSignature), statement(:Proof1, rdf:type, sec:DataIntegrityProof), statement(:Proof1, sec:cryptosuite, "ecdsa-rdfc-2019"), statement(:Proof1, sec:issuer, :University), statement(:Proof1, sec:validUntil, "2025-04-03T00:00:00.000Z")])).
triple(:association, :cryptosuite, "ecdsa-rdfc-2019").
triple(:association, :dataGraph, :DataGraph).
triple(:association, :issuer, :University).
triple(:association, :metadataGraph, :MetadataGraph).
triple(:association, :signatureGraph, :SignatureGraph).
triple(:association, :status, :contextAssociationVerified).
triple(:association, :subject, :Bob).
