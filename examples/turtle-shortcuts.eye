# Source: eyeleng/examples/turtle-shortcuts.srl (b7c7e46f8297).
knows(alice, bob). knows(alice, carol). score(alice, 8). score(bob, 3).
known_by(?friend, ?person, ?score) if knows(?person, ?friend), score(?person, ?score), ?score >= 5.
ask known_by(?friend, ?person, ?score).
