# Source: eyeleng/examples/query.srl (b7c7e46f8297).
parent(alice, bob). parent(bob, carol). parent(dora, emma).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(?x, ?y).
