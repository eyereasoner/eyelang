# Source: eyeleng/examples/annotation-evidence.srl (b7c7e46f8297).
statement(alice, name, "Alice"). reifies(claim, triple(alice, name, "Alice")).
stated_by(claim, bob). recorded(claim, date(2021, 7, 7)).
statement_author(?who) if reifies(?claim, triple(alice, name, "Alice")), stated_by(?claim, ?who).
ask statement_author(?who).
