# Source: eyeleng/examples/spec-4-1-srl-syntax.srl (b7c7e46f8297).
values(x, 1, 2).
both_positive(?x) if values(?x, ?a, ?b), ?a > 0, ?b > 0.
one_zero(?x) if values(?x, 0, ?b). one_zero(?x) if values(?x, ?a, 0).
ask both_positive(?x). ask one_zero(?x).
