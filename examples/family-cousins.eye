# Source: eyeleng/examples/family-cousins.srl (b7c7e46f8297).
parent(adam, bob). parent(adam, carol). parent(bob, dave). parent(bob, eve). parent(carol, frank). parent(carol, grace).
branch(dave, b). branch(eve, b). branch(frank, c). branch(grace, c).
different(b, c). different(c, b).
generation(bob, 1). generation(carol, 1). generation(dave, 2). generation(eve, 2). generation(frank, 2). generation(grace, 2).
cousin(?x, ?y) if generation(?x, ?g), generation(?y, ?g), branch(?x, ?bx), branch(?y, ?by), different(?bx, ?by).
ask cousin(?person, ?cousin).
