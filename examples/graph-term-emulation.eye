# Source: eyeleng/examples/graph-term-emulation.srl (b7c7e46f8297).
graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)])).
graph_term(g2, graph([triple(alice, likes, tea)])).
contains(?graph, ?statement) if graph_term(?graph, graph([?statement | ?rest])).
contains(?graph, ?statement) if graph_term(?graph, graph([?first | ?rest])), member(?statement, ?rest).
member(?x, [?x | ?tail]). member(?x, [?head | ?tail]) if member(?x, ?tail).
social(?graph) if contains(?graph, triple(?s, knows, ?o)).
ask social(?graph).
