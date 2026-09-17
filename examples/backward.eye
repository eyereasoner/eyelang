# Eyelang example: backward.
value(five, 5). value(three, 3).
more_interesting(?x, ?y) if value(?x, ?left), value(?y, ?right), ?left > ?right.
ask more_interesting(?x, ?y).
