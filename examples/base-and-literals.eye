# Source: eyeleng/examples/base-and-literals.srl (b7c7e46f8297).
person(alice, literal("Alice Smith", en), typed(22, integer)).
person(bob, literal("Bob", nl), typed(17, integer)).
adult(?person) if person(?person, literal(?name, en), typed(?age, integer)), ?age >= 18.
ask adult(?person).
