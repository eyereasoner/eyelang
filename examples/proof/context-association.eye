# Eyelang result format 1
query(1, at(27, 1), [call(association(?v0, ?v1, ?v2, ?v3, ?v4, ?v5))], [binding("subject", ?v0), binding("dataGraph", ?v1), binding("signatureGraph", ?v2), binding("metadataGraph", ?v3), binding("cryptosuite", ?v4), binding("issuer", ?v5)]).
result(1, complete, 1).
answer(1, [binding("subject", bob), binding("dataGraph", blank(g0)), binding("signatureGraph", blank(g1)), binding("metadataGraph", blank(g3)), binding("cryptosuite", "ecdsa-rdfc-2019"), binding("issuer", iri("https://university.example/issuers/14"))]).
why(1, [binding("subject", bob), binding("dataGraph", blank(g0)), binding("signatureGraph", blank(g1)), binding("metadataGraph", blank(g3)), binding("cryptosuite", "ecdsa-rdfc-2019"), binding("issuer", iri("https://university.example/issuers/14"))], 11).
query(2, at(29, 1), [call(quad(bob, foaf_name, "Bob", blank(g1)))], []).
result(2, complete, 0).
proof(1, quad(bob, foaf_name, "Bob", blank(g0)), rule(1, at(5, 1)), []).
proof(2, quad(blank(g0), sec_proof, blank(dataSignature), blank(g1)), rule(2, at(6, 1)), []).
proof(3, quad(blank(signature1), rdf_type, DataIntegrityProof, blank(g1)), rule(3, at(7, 1)), []).
proof(4, quad(blank(signature1), sec_cryptosuite, "ecdsa-rdfc-2019", blank(g1)), rule(4, at(8, 1)), []).
proof(5, quad(blank(signature1), sec_issuer, iri("https://university.example/issuers/14"), blank(g1)), rule(5, at(9, 1)), []).
proof(6, quad(blank(signature1), sec_validUntil, typed("2025-04-03T00:00:00.000Z", iri("http://www.w3.org/2001/XMLSchema#dateTime")), blank(g1)), rule(6, at(10, 1)), []).
proof(7, quad(blank(g1), sec_proof, blank(signature2), blank(g3)), rule(7, at(11, 1)), []).
proof(8, quad(blank(signature2), rdf_type, DataIntegrityProof, blank(g3)), rule(8, at(12, 1)), []).
proof(9, quad(blank(signature2), sec_proofPurpose, "assertionMethod", blank(g3)), rule(9, at(13, 1)), []).
proof(10, association(bob, blank(g0), blank(g1), blank(g3), "ecdsa-rdfc-2019", iri("https://university.example/issuers/14")), rule(10, at(15, 1)), [uses(1, quad(bob, foaf_name, "Bob", blank(g0))), uses(2, quad(blank(g0), sec_proof, blank(dataSignature), blank(g1))), uses(3, quad(blank(signature1), rdf_type, DataIntegrityProof, blank(g1))), uses(4, quad(blank(signature1), sec_cryptosuite, "ecdsa-rdfc-2019", blank(g1))), uses(5, quad(blank(signature1), sec_issuer, iri("https://university.example/issuers/14"), blank(g1))), compared("=", iri("https://university.example/issuers/14"), iri("https://university.example/issuers/14")), uses(6, quad(blank(signature1), sec_validUntil, typed("2025-04-03T00:00:00.000Z", iri("http://www.w3.org/2001/XMLSchema#dateTime")), blank(g1))), uses(7, quad(blank(g1), sec_proof, blank(signature2), blank(g3))), uses(8, quad(blank(signature2), rdf_type, DataIntegrityProof, blank(g3))), uses(9, quad(blank(signature2), sec_proofPurpose, "assertionMethod", blank(g3)))]).
proof(11, solution([bob, blank(g0), blank(g1), blank(g3), "ecdsa-rdfc-2019", iri("https://university.example/issuers/14")]), query, [uses(10, association(bob, blank(g0), blank(g1), blank(g3), "ecdsa-rdfc-2019", iri("https://university.example/issuers/14")))]).
