# Source: eyeleng/examples/collections-and-blank-nodes.srl (b7c7e46f8297).
knows(alice, blank(person1)). name(blank(person1), "Bob"). tag(blank(person1), friend).
members(team, [alice, bob, carol]).
knows_named(?person, ?name) if knows(?person, ?node), name(?node, ?name).
first_member(?first) if members(team, [?first | ?rest]).
ask knows_named(?person, ?name). ask first_member(?first).
