# Source: eyeleng/examples/collection.srl (b7c7e46f8297).
value(root, [1, node(q), [2]]).
first(?x) if value(root, [?x, ?middle, ?last]).
blank_property(?x) if value(root, [?first, node(?x), ?last]).
nested_first(?x) if value(root, [?first, ?middle, [?x]]).
ask first(?x). ask blank_property(?x). ask nested_first(?x).
