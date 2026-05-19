triple(:DataGraph, log:nameOf, graph([triple(:Bob, foaf:name, "Bob")])).
triple(:MetadataGraph, log:nameOf, graph([triple(:SignatureGraph, sec:proof, :MetadataSignature), triple(:MetadataProof, rdf:type, sec:DataIntegrityProof), triple(:MetadataProof, sec:proofPurpose, "assertionMethod")])).
triple(:SignatureGraph, log:nameOf, graph([triple(:DataGraph, sec:proof, :DataSignature), triple(:Proof1, rdf:type, sec:DataIntegrityProof), triple(:Proof1, sec:cryptosuite, "ecdsa-rdfc-2019"), triple(:Proof1, sec:issuer, :University), triple(:Proof1, sec:validUntil, "2025-04-03T00:00:00.000Z")])).
triple(:association, :cryptosuite, "ecdsa-rdfc-2019").
triple(:association, :dataGraph, :DataGraph).
triple(:association, :issuer, :University).
triple(:association, :metadataGraph, :MetadataGraph).
triple(:association, :signatureGraph, :SignatureGraph).
triple(:association, :status, :contextAssociationVerified).
triple(:association, :subject, :Bob).
