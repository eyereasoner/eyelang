# Source: eyeleng/examples/unstratified-negation.srl (b7c7e46f8297).
person(alice). in(?x) if person(?x), not out(?x). out(?x) if person(?x), not in(?x). ask in(alice).
