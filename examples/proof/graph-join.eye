# Eyelang result format 1
query(1, at(8, 1), [call(trusted(?v0))], [binding("claim", ?v0)]).
result(1, complete, 1).
answer(1, [binding("claim", iri("https://example/claim1"))]).
why(1, [binding("claim", iri("https://example/claim1"))], 4).
proof(1, quad(iri("https://example/alice"), iri("https://example/role"), iri("https://example/reviewer"), iri("https://example/staff")), rule(1, at(3, 1)), []).
proof(2, quad(iri("https://example/alice"), iri("https://example/approved"), iri("https://example/claim1"), iri("https://example/reviews")), rule(2, at(4, 1)), []).
proof(3, trusted(iri("https://example/claim1")), rule(3, at(5, 1)), [uses(1, quad(iri("https://example/alice"), iri("https://example/role"), iri("https://example/reviewer"), iri("https://example/staff"))), uses(2, quad(iri("https://example/alice"), iri("https://example/approved"), iri("https://example/claim1"), iri("https://example/reviews")))]).
proof(4, solution([iri("https://example/claim1")]), query, [uses(3, trusted(iri("https://example/claim1")))]).
