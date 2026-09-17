# Source: eyeleng/examples/assignment.srl (b7c7e46f8297).
score(alice, 7). score(bob, 3).
grade(?person, pass(?score)) if score(?person, ?score), ?score >= 5.
ask grade(?person, ?grade).
