# Source: eyeleng/examples/backward.srl (b7c7e46f8297).
value(five, 5). value(three, 3).
more_interesting(?x, ?y) if value(?x, ?left), value(?y, ?right), ?left > ?right.
ask more_interesting(?x, ?y).
