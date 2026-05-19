% Context association adapted from Eyeling context-association.n3.
%
% This version keeps the original shape: each context is named with log_nameOf
% and its contents remain quoted formula data.  Nothing inside the three formulae
% is asserted globally unless a rule explicitly projects it.

triple(skolem_g0, log_nameOf, triple(bob, foaf_name, "Bob")).

triple(skolem_g1, log_nameOf, (
  triple(skolem_g0, sec_proof, dataSignature),
  triple(signature1, rdf_type, sec_DataIntegrityProof),
  triple(signature1, sec_cryptosuite, "ecdsa-rdfc-2019"),
  triple(signature1, sec_created, "2021-11-13T18:19:39Z"),
  triple(signature1, sec_verificationMethod, "https://university.example/issuers/14#key-1"),
  triple(signature1, sec_proofPurpose, "assertionMethod"),
  triple(signature1, sec_proofValue, "z58DAdFfa9SkqZMVPxAQp...jQCrfFPP2oumHKtz"),
  triple(signature1, sec_issuer, university),
  triple(signature1, sec_validFrom, "2024-04-03T00:00:00.000Z"),
  triple(signature1, sec_validUntil, "2025-04-03T00:00:00.000Z")
)).

triple(g3, log_nameOf, (
  triple(skolem_g1, sec_proof, signature2),
  triple(signature2, rdf_type, sec_DataIntegrityProof),
  triple(signature2, sec_cryptosuite, "ecdsa-rdfc-2019"),
  triple(signature2, sec_created, "2021-11-13T18:19:39Z"),
  triple(signature2, sec_verificationMethod, "https://university.example/issuers/14#key-1"),
  triple(signature2, sec_proofPurpose, "assertionMethod"),
  triple(signature2, sec_proofValue, "adad123efv434r5200...dqed2t44v43das")
)).

% A tiny projection shows how a program can inspect a quoted context without
% making the entire context globally true.
context_triple(Context, Subject, Predicate, Object) :-
  triple(Context, log_nameOf, Formula),
  formula_triple(Formula, Subject, Predicate, Object).

triple(association, dataGraph, skolem_g0) :-
  context_triple(skolem_g0, bob, foaf_name, "Bob").

triple(association, signatureGraph, skolem_g1) :-
  context_triple(skolem_g1, skolem_g0, sec_proof, dataSignature).

triple(association, metadataGraph, g3) :-
  context_triple(g3, skolem_g1, sec_proof, signature2).
