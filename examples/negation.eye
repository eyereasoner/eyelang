# Source: eyeleng/examples/negation.srl (b7c7e46f8297).
person(alice). person(bob). blocked(bob).
eligible(?x) if person(?x), not blocked(?x).
ask eligible(?person).
