% Context association adapted from Eyeling context-association.n3.
%
% This version keeps the original shape: each context is named with log:nameOf
% and its contents remain quoted graph data.  Nothing inside the three graphs
% is asserted globally unless a rule explicitly projects it.

triple(skolem:g0, log:nameOf, graph([
  triple(:Bob, foaf:name, "Bob")
])).

triple(skolem:g1, log:nameOf, graph([
  triple(skolem:g0, sec:proof, :dataSignature),
  triple(:signature1, rdf:type, sec:DataIntegrityProof),
  triple(:signature1, sec:cryptosuite, "ecdsa-rdfc-2019"),
  triple(:signature1, sec:created, "2021-11-13T18:19:39Z"),
  triple(:signature1, sec:verificationMethod, "https://university.example/issuers/14#key-1"),
  triple(:signature1, sec:proofPurpose, "assertionMethod"),
  triple(:signature1, sec:proofValue, "z58DAdFfa9SkqZMVPxAQp...jQCrfFPP2oumHKtz"),
  triple(:signature1, sec:issuer, :University),
  triple(:signature1, sec:validFrom, "2024-04-03T00:00:00.000Z"),
  triple(:signature1, sec:validUntil, "2025-04-03T00:00:00.000Z")
])).

triple(:g3, log:nameOf, graph([
  triple(skolem:g1, sec:proof, :signature2),
  triple(:signature2, rdf:type, sec:DataIntegrityProof),
  triple(:signature2, sec:cryptosuite, "ecdsa-rdfc-2019"),
  triple(:signature2, sec:created, "2021-11-13T18:19:39Z"),
  triple(:signature2, sec:verificationMethod, "https://university.example/issuers/14#key-1"),
  triple(:signature2, sec:proofPurpose, "assertionMethod"),
  triple(:signature2, sec:proofValue, "adad123efv434r5200...dqed2t44v43das")
])).

% A tiny projection shows how a program can inspect a quoted context without
% making the entire context globally true.
context_triple(Context, Subject, Predicate, Object) :-
  triple(Context, log:nameOf, graph(Statements)),
  member(triple(Subject, Predicate, Object), Statements).

triple(:association, :dataGraph, skolem:g0) :-
  context_triple(skolem:g0, :Bob, foaf:name, "Bob").

triple(:association, :signatureGraph, skolem:g1) :-
  context_triple(skolem:g1, skolem:g0, sec:proof, :dataSignature).

triple(:association, :metadataGraph, :g3) :-
  context_triple(:g3, skolem:g1, sec:proof, :signature2).
