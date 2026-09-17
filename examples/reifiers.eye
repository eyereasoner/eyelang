# Source: eyeleng/examples/reifiers.srl (b7c7e46f8297).
reifies(claim1, triple(alice, says, hello)). source(claim1, chat).
reifies(claim2, triple(bob, says, hi)). source(claim2, email).
statement_source(?speaker, ?source) if reifies(?claim, triple(?speaker, says, ?object)), source(?claim, ?source).
ask statement_source(?speaker, ?source). ask reifies(?claim, ?statement).
