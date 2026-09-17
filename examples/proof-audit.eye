# Run with proof facts from another Eyelang invocation:
# node bin/eyelang.js examples/proof/socrates.eye examples/proof-audit.eye
# Tests and the example generator supply that document automatically.

member(?x, [?x | ?_]).
member(?x, [?_ | ?rest]) if member(?x, ?rest).

# Positive premises and completed collections both carry proof references.
parent_proof(?id, ?parent) if
    proof(?id, ?_, ?_, ?premises), member(uses(?parent, ?_), ?premises).
parent_proof(?id, ?parent) if
    proof(?id, ?_, ?_, ?premises),
    member(collected(?_, ?_, ?_, ?parents, complete), ?premises),
    member(?parent, ?parents).

depends_on(?id, ?parent) if parent_proof(?id, ?parent).
depends_on(?id, ?ancestor) if parent_proof(?id, ?parent), depends_on(?parent, ?ancestor).

source_fact(?id, ?fact) if proof(?id, ?fact, rule(?_, ?_), []).
supporting_fact(?id, ?fact) if source_fact(?id, ?fact).
supporting_fact(?id, ?fact) if depends_on(?id, ?ancestor), source_fact(?ancestor, ?fact).

support(?query, ?fact) if why(?query, ?_, ?proof), supporting_fact(?proof, ?fact).

ask depends_on(3, ?ancestor).
ask support(1, ?fact).
