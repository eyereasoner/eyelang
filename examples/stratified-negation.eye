# Source: eyeleng/examples/stratified-negation.srl (b7c7e46f8297).
person(alice). person(bob). person(carol). directly_blocked(alice). flagged(carol).
blocked(?x) if directly_blocked(?x). blocked(?x) if flagged(?x).
eligible(?x) if person(?x), not blocked(?x).
ask eligible(?person).
