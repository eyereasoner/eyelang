# Source: eyeleng/examples/backward-recursion.srl (b7c7e46f8297).
parent(a, b). parent(b, c). parent(c, d).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(a, ?who).
