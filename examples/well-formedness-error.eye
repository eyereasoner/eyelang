# Source: eyeleng/examples/well-formedness-error.srl (b7c7e46f8297).
score(alice, 10). bad if ?score > 5, score(alice, ?score). ask bad.
