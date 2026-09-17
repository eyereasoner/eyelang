# Source: eyeleng/examples/version-and-in.srl (b7c7e46f8297).
level(alice, gold). level(bob, bronze). level(carol, platinum).
priority(?x) if level(?x, gold). priority(?x) if level(?x, platinum).
ordinary(?x) if level(?x, bronze).
ask priority(?person). ask ordinary(?person).
